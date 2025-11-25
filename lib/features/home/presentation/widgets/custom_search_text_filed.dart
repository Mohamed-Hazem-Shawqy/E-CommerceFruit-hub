import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomSearchTextFiled extends StatelessWidget {
  const CustomSearchTextFiled({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),

      child: TextField(
        controller: controller,
        cursorColor: AppColor.appDarkGreenColor,

        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: SizedBox(
            width: MediaQuery.sizeOf(context).width / 6,
            child: Center(child: SvgPicture.asset(Assets.imagesFilter)),
          ),
          prefixIcon: SizedBox(
            width: MediaQuery.sizeOf(context).width / 6,
            child: Center(child: SvgPicture.asset(Assets.imagesSearch)),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: 'searchFor'.tr(),
          hintStyle: AppTextStyle.regular14.copyWith(
            color: AppColor.appLightGrayColor,
          ),
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
        ),
      ),
    );
  }
}

InputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(width: .9, color: Color(0xffE6E9EA)),
  );
}
