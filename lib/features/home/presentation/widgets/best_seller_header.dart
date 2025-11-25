import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';
import 'package:fruits_hub_app/features/home/presentation/views/more_best_seller.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BestSellerHeader extends StatelessWidget {
  const BestSellerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('bestSeller'.tr(), style: AppTextStyle.bold16),
        const Spacer(),
        GestureDetector(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: MoreBestSeller(),
              withNavBar: true,
            );
          },
          child: Text('more'.tr(), style: AppTextStyle.regular13),
        ),
      ],
    );
  }
}
