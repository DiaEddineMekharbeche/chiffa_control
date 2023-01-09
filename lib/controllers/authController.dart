import 'dart:convert';

import 'package:chiffa_control/components/loadingWidget.dart';
import 'package:chiffa_control/pages/navigationbar.dart';
import 'package:chiffa_control/respApi/resApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final restApi = RestApi();
  var isLoading = false.obs;

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
}
