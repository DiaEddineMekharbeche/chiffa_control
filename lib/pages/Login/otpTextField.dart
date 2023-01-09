
import 'package:chiffa_control/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpTextField extends StatelessWidget {
  final TextEditingController controller;
  const OtpTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 50.h,
      child: TextFormField(
        
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
         style: TextStyle(
                color: Colors.black, fontSize: 17.sp, height: 1.sp),
          keyboardType: TextInputType.number,
          controller: controller,
          cursorColor: primaryColor,
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              hintText: "*",
              
             hintStyle: TextStyle(
                  color: const Color(0xffA8A8A8), fontSize: 20.sp, height: 1.sp),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: const Color(0xffbdbdbd), width: 1.h)),
                        focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:  BorderSide(color: primaryColor , width: 2.w)))),
    );
  }
}
