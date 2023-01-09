


import 'package:chiffa_control/constants.dart';
import 'package:chiffa_control/controllers/authController.dart';
import 'package:chiffa_control/pages/Login/auth_button.dart';
import 'package:chiffa_control/pages/Login/forget_password.dart';
import 'package:chiffa_control/pages/Login/reset_password_page.dart';
import 'package:chiffa_control/pages/Login/signupTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class LoginPage extends StatelessWidget {
   LoginPage({super.key});
  final AuthController c = Get.put(AuthController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: c.signinFormKey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(26.6.w, 88.h, 25.w, 6.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Image.asset(
                  'assets/images/bro1.png',
                  height: 128.h,
                  width: 128.w,
                  alignment: Alignment.center,
                )),
                SizedBox(height: 24.h),
                Center(
                  child: Text(
                    "welcome".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff333333),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  'Email'.tr,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: const Color(0xff4F4F4F)),
                ),
                SizedBox(height: 4.h),
                SignUpTextField(
                    title: 'your_email'.tr,
                    obscuredIcon: false,
                    textFieldicon: Image.asset('assets/images/m.png',height: 1.h,width: 1.w,),
                    textController: emailController,
                    validatorFunction: (value) {
                      return c.validateEmail(value);
                    }),
                SizedBox(height: 20.h),
                Text(
                  'password'.tr,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Gilroy',
                      fontStyle: FontStyle.normal,
                      color: const Color(0xff4F4F4F)),
                ),
                SizedBox(height: 3.h),
                SignUpTextField(
                    title: 'password'.tr,
                    textFieldicon: Image.asset('assets/images/pass.png'),
                    obscuredIcon: true,
                    textController: passwordController,
                    validatorFunction: (value) {
                      return c.validatePassword(value);
                    }),
                SizedBox(height: 12.h),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text('forgot_password'.tr,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: primaryColorDeep,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  onTap: () {
                    Get.to(()=>  ForgotPassword());
                  },
                ),
                SizedBox(height: 24.h),
                AuthButthon(
                    inputText: 'sign_in'.tr,
                    onClick: () => c.signin(
                        emailController.text, passwordController.text)),
                SizedBox(height: 32.h),
       
              
           
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}