import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SignUpTextField extends StatefulWidget {
  final String title;
  final bool obscuredIcon;
  final TextEditingController textController;
  final Function validatorFunction;
  final Image textFieldicon;
  const SignUpTextField(
      {Key? key,
      required this.title,
      required this.obscuredIcon,
      required this.textController,
      required this.validatorFunction,
      required this.textFieldicon})
      : super(key: key);

  @override
  State<SignUpTextField> createState() => _SignUpTextFieldState();
}

class _SignUpTextFieldState extends State<SignUpTextField> {
  bool isobscured = true;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) => widget.validatorFunction(value),
        style: TextStyle(
                color: Colors.black, fontSize: 17.sp, height: 1.sp),
        controller: widget.textController,
        obscureText: widget.obscuredIcon ? isobscured : false,
        textAlign: TextAlign.left,
        cursorColor: Colors.blueAccent,
        decoration: InputDecoration(
            prefixIcon: widget.textFieldicon,
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:  BorderSide(color: Colors.red ,  width: 2.w)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:  BorderSide(color: Colors.blueAccent , width: 2.w)),
            hintText: widget.title,
            hintStyle: TextStyle(
                color: const Color(0xffA8A8A8), fontSize: 15.sp, height: 1.sp),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: const Color(0xf5f5f5f5).withOpacity(0.1),
                    width: 1.h)),
            suffixIcon: widget.obscuredIcon
                ? IconButton(
                    icon: Icon(
                        isobscured ? Icons.visibility : Icons.visibility_off),
                    color: Colors.grey.withOpacity(0.5),
                    iconSize: 26.sp,
                    onPressed: () {
                      setState(() {
                        isobscured = !isobscured;
                      });
                    })
                : const SizedBox()));
  }
}
