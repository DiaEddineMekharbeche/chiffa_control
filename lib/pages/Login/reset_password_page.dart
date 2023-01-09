






import 'package:chiffa_control/controllers/authController.dart';
import 'package:chiffa_control/pages/Login/signupTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isobscured = true;
  final AuthController c = Get.find();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 45),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(right: 292.w),
              child: Container(
                height: 35.h,
                width: 35.w,
                decoration: BoxDecoration(
                    color: const Color(0xf5f5f5f5).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: const Color(0xffbdbdbd), width: 1.h)),
                child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 15),
                    onPressed: (() => Get.back())),
              ),
            ),
            SizedBox(height: 33.h),
            Center(
                child: Column(children: [
              Image.asset(
                'assets/images/newpass.png',
                alignment: Alignment.center,
              ),
              SizedBox(height: 32.h),
              Text(
                '${'Reset password'.tr}?',
                style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff333333),
                    fontStyle: FontStyle.normal),
              ),
              SizedBox(height: 8.h),
              Text('enter new password'.tr,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff828282))),
            ])),
            SizedBox(height: 32.h),
            Text(
              'reset password'.tr,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w100,
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
            SizedBox(height: 32.h),
            Text(
              'Confirmer ${'reset password'.tr}',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.normal,
                  color: const Color(0xff4F4F4F)),
            ),
            SizedBox(height: 3.h),
            SignUpTextField(
                title: 'password'.tr,
                textFieldicon: Image.asset('assets/images/pass.png'),
                obscuredIcon: true,
                textController: confirmPasswordController,
                validatorFunction: (value) {
                  return c.validatePassword(value);
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
                  await c.resetPassword(
                      passwordController.text, confirmPasswordController.text);
                },
                child: Text(
                  'update password'.tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
