import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/services/shared_pref_singleton.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/constant.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/login_view_page.dart';
import 'package:fruits_hub_app/core/widgets/custom_button.dart';

class IndicatorAndButton extends StatelessWidget {
  const IndicatorAndButton({super.key, required this.isVisible2});

  final bool? isVisible2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColor.appDarkGreenColor,
            color: isVisible2 ?? false
                ? AppColor.appDarkGreenColor
                : AppColor.appDarkGreenColor.withValues(alpha: .5),
          ),
        ),
        const SizedBox(height: 29),

        Visibility(
          visible: isVisible2 ?? false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
              text: tr('startnow'),
              onPressed: () {
                SharedPrefSingleton.setBool(kIsOnBoardingSeenBefore, true);

                Navigator.pushReplacementNamed(
                  context,
                  LoginViewPage.routeName,
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 43),
      ],
    );
  }
}
