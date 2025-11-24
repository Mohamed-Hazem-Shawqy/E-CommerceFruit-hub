import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColor.appGrayColor)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text('or'.tr(), style: AppTextStyle.semiBold16),
        ),
        const Expanded(child: Divider(color: AppColor.appGrayColor)),
      ],
    );
  }
}
