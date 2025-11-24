import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';
import 'package:svg_flutter/svg.dart';

class CustomSocialAuthButton extends StatelessWidget {
  const CustomSocialAuthButton({
    super.key,
    required this.text,
    required this.image,
    this.onPressed,
  });
  final String text;
  final String image;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFFDCDEDE)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: SvgPicture.asset(image),
          title: Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyle.semiBold16.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
