import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';

class DonotOrHaveAnAccount extends StatelessWidget {
  const DonotOrHaveAnAccount({
    super.key,
    required this.text1,
    required this.text2,
    required this.routeName,
  });

  final String text1;
  final String text2;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text1.tr(),
            style: AppTextStyle.semiBold16.copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
          TextSpan(
            text: ' ',
            style: AppTextStyle.semiBold16.copyWith(
              color: const Color(0xFF616A6B),
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacementNamed(context, routeName);
              },

            text: text2.tr(),
            style: AppTextStyle.semiBold16.copyWith(
              color: AppColor.appDarkGreenColor,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
