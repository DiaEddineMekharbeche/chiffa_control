import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButthon extends StatelessWidget {
  final String inputText;
  final VoidCallback onClick;
  const AuthButthon({Key? key, required this.inputText, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: const Color(0xff2954E7)),
      child: MaterialButton(
        onPressed: () {
          onClick();
        },
        child: Text(
          inputText,
          style: TextStyle(color: Colors.white, fontSize: 18.sp,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}