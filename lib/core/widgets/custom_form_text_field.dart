import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    super.key,
     this.obscureText=false,
    required this.hintText,
    this.keyboardType,
    this.suffixIcon,
    this.controller,
  });

  final bool obscureText;
  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'thisFiledRequired'.tr();
        } return null;
      },
      controller: controller,
      cursorColor: AppColor.appDarkGreenColor,

      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: AppColor.appGrayColor,
        filled: true,
        fillColor: Color(0xffF9FAFA),
        hintText: hintText.tr(),
        hintStyle: AppTextStyle.bold12.copyWith(color: AppColor.appGrayColor),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
      ),
    );
  }
}

InputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(width: .9, color: Color(0xffE6E9EA)),
  );
}
