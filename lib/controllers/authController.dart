import 'dart:convert';

import 'package:chiffa_control/components/loadingWidget.dart';
import 'package:chiffa_control/pages/Login/login_page.dart';
import 'package:chiffa_control/pages/Login/reset_password_page.dart';
import 'package:chiffa_control/pages/navigationbar.dart';
import 'package:chiffa_control/respApi/resApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final restApi = RestApi();
  var isLoading = false.obs;
  var forgotPasswordEmail = "";
  var forgotPasswordAccesToken = "";
  GlobalKey<FormState> authFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  String? validateEmail(String value) {
    if (GetUtils.isBlank(value)! || !GetUtils.isEmail(value)) {
      return 'empty_field'.tr;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (GetUtils.isBlank(value)!) {
      return 'empty_field'.tr;
    }
    if (value.length < 6) {
      return 'password_length'.tr;
    }

    return null;
  }

  bool checksignin() {
    final isValid = signinFormKey.currentState!.validate();
    if (!isValid) {
      return false;
    }
    signinFormKey.currentState!.save();
    return true;
  }

  signin(String email, String password) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (!checksignin()) {
      return;
    }
    isLoading(true);
    Get.defaultDialog(content: const LoadingWidget(), title: "");
    final response = await restApi.login(email, password);
    Get.back();
    isLoading(false);

    if (response.statusCode == 409) {
      Get.snackbar('Error'.tr, 'incorrect_username_password'.tr,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20));
      return;
    }
    if (response.statusCode != 200) {
      Get.snackbar('Error'.tr, 'Internal server error !'.tr,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20));

      return;
    }
    final data = json.decode(response.body);
    pref.setString('token', data['accessToken'].toString());
    

    Get.back();
    Get.off(() => const NavBar());
  }
  bool checkforgotPassword() {
    final isValid = forgotPasswordFormKey.currentState!.validate();
    if (!isValid) {
      return false;
    }
    forgotPasswordFormKey.currentState!.save();
    return true;
  }

    Future<bool> postRestPass() async {
    try {
      if (!checkforgotPassword()) {
        return false;
      }

      Get.defaultDialog(content: const LoadingWidget(), title: "");
      final response = await restApi.postRestPassword(forgotPasswordEmail);
      Get.back();
      if (response.statusCode == 200) {
        Get.snackbar('Success'.tr, 'check_inbox'.tr,
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.green[400],
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20));
        return true;
      } else {
        Get.snackbar('Error'.tr, 'Internal server error !'.tr,
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20));
        return false;
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error'.tr, 'Internal server error !'.tr,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20));
      return false;
    }
  }
    postOtp(String otp) async {
    try {
      Get.defaultDialog(content: const LoadingWidget(), title: "");
      final response = await restApi.postOtp(otp);
      Get.back();

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        forgotPasswordAccesToken = result['accessToken'];
        Get.to(() => const ResetPassword());
      } else {
        return Get.snackbar('Error'.tr, 'Internal server error !'.tr,
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20));
      }
    } catch (e) {
      Get.back();
      return Get.snackbar('Error'.tr, 'Internal server error !'.tr,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20));
    }
  }
    bool validateConfirmPassword(String value1, String value2) {
    if (value1 != value2 || value1.isEmpty) {
      Get.snackbar("Error".tr, "match password".tr,
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          padding: EdgeInsets.all(16.w),
          borderRadius: 6.h,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20));

      return false;
    }
    return true;
  }
    resetPassword(String password, String confirmPassword) async {
    try {
      if (!validateConfirmPassword(password, confirmPassword)) {
        return;
      }
      Get.defaultDialog(content: const LoadingWidget(), title: "");
      final response =
          await restApi.postNewPassword(password, forgotPasswordAccesToken);
      Get.back();
      if (response.statusCode == 409) {
        return Get.snackbar('Error'.tr, "mail_not_exist_reset_password".tr,
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20));
      }
      if (response.statusCode == 200) {
        Get.offAll(LoginPage());
        return Get.snackbar('Success'.tr, 'password_updated_success'.tr,
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.green[400],
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20));
      } else {
        return Get.snackbar('Error'.tr, 'Internal server error !'.tr,
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20));
      }
    } catch (e) {
      Get.back();
      return Get.snackbar('Error'.tr, 'Internal server error !'.tr,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20));
    }
  }
}
