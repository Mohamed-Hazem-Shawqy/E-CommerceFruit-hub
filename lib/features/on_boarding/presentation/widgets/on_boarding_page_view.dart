import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';
import 'package:fruits_hub_app/features/on_boarding/presentation/widgets/custom_page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        CustomPageViewItem(
          isVisible: true,
          image: Assets.imagesOnBoardingImage1,
          backGroundImage: Assets.imagesOnBoardingBackGround1,
          subTitle: tr("onboarding_page1_subTitle"),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tr("onboarding_page1_title_part1"),
                style: AppTextStyle.bold23,
              ),
              Text(
                tr("onboarding_page1_title_part2"),
                style: AppTextStyle.bold23.copyWith(
                  color: AppColor.appOrangeColor,
                ),
              ),
              Text(
                tr("onboarding_page1_title_part3"),
                style: AppTextStyle.bold23.copyWith(
                  color: AppColor.appDarkGreenColor,
                ),
              ),
            ],
          ),
        ),
        CustomPageViewItem(
          isVisible2: true,
          image: Assets.imagesOnBoardingImage2,
          backGroundImage: Assets.imagesOnBoardingBackGround2,
          subTitle: tr("onboarding_page2_subTitle"),
          title: Text(
            tr("onboarding_page2_title"),
            style: AppTextStyle.bold23,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
