


import 'package:chiffa_control/controllers/authController.dart';
import 'package:chiffa_control/pages/Login/login_page.dart';
import 'package:chiffa_control/pages/Login/otpCodeVerification.dart';
import 'package:chiffa_control/pages/Login/signupTextField.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
    ForgotPassword({Key? key}) : super(key: key);

  final c = Get.put(AuthController());

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: c.forgotPasswordFormKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 45),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 35.h,
                width: 35.w,
                decoration: BoxDecoration(
                    color: const Color(0xf5f5f5f5).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: const Color(0xffbdbdbd), width: 1.h)),
                child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new, size: 15.h),
                    onPressed: (() => Get.back())),
              ),
              SizedBox(height: 33.h),
              Center(
                  child: Column(children: [
                Image.asset(
                  'assets/images/forgotpassword.png',
                  alignment: Alignment.center,
                ),
                SizedBox(height: 32.h),
                Text(
                  'forgot_password'.tr,
                  style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff333333),
                      fontStyle: FontStyle.normal),
                ),
                SizedBox(height: 8.h),
                Text('Enter your Email'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff828282))),
              ])),
              SizedBox(height: 32.h),
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
                  title: 'your email'.tr,
                  obscuredIcon: false,
                  textFieldicon: Image.asset('assets/images/m.png'),
                  textController: emailController,
                  validatorFunction: (value) {
                    return c.validateEmail(value);
                  }),
              SizedBox(height: 32.h),
              Container(
                height: 45.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff2954E7)),
                child: MaterialButton(
                  onPressed: () async {
                    c.forgotPasswordEmail = emailController.text;
                    // if (await c.postRestPass()) {
                    //   Get.to(() => const OtpVerification());
                    // }
                    Get.to(() => const OtpVerification());
                  },
                  child: Text(
                    'send_email'.tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Center(
                child: RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Did you remember your password '.tr,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black)),
                         
                    TextSpan(
                        text: 'Login'.tr,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xff2954E7),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(()=>LoginPage());
                          }),
                  ],
                )),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}