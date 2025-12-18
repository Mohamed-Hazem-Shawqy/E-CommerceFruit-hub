import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';
import 'package:svg_flutter/svg.dart';

class ProductsHeader extends StatelessWidget {
  const ProductsHeader({super.key, required this.length});
  final int length;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$length ${'result'.tr()}", style: AppTextStyle.bold16),
        const Spacer(),
        SvgPicture.asset(Assets.imagesDoubleArrowFilter),
      ],
    );
  }
}
