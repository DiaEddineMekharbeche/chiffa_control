import 'package:chiffa_control/controllers/authController.dart';
import 'package:chiffa_control/pages/Login/otpTextField.dart';
import 'package:chiffa_control/pages/Login/reset_password_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  AuthController c = Get.put(AuthController());
  TextEditingController otpController = TextEditingController();
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
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
                'assets/images/otp.png',
                alignment: Alignment.center,
              ),
              SizedBox(height: 32.h),
              Text(
                'otp verifivation'.tr,
                style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff333333),
                    fontStyle: FontStyle.normal),
              ),
              SizedBox(height: 8.h),
              Text('otp code sent'.tr,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff828282))),
            ])),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OtpTextField(controller: otpController),
                OtpTextField(controller: otp1Controller),
                OtpTextField(controller: otp2Controller),
                OtpTextField(controller: otp3Controller),
                OtpTextField(controller: otp4Controller),
              ],
            ),
            SizedBox(height: 32.h),
            Container(
              height: 45.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xff2954E7)),
              child: MaterialButton(
                onPressed: () async {
                  // String otp =
                  //     '${otpController.text}${otp1Controller.text}${otp2Controller.text}${otp3Controller.text}${otp4Controller.text}';
                  // await c.postOtp(otp);
                  Get.to(() => const ResetPassword());
                },
                child: Text(
                  'verify code'.tr,
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
                      text: "I Didn't receive a code".tr,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black)),
                  TextSpan(
                      text: 'Resend'.tr,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xff2954E7),
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          await c.postRestPass();
                        }),
                ],
              )),
            ),
          ]),
        ),
      ),
    );
  }
}
