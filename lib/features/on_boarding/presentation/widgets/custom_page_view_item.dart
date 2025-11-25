import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/services/shared_pref_singleton.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';
import 'package:fruits_hub_app/core/utils/constant.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/login_view_page.dart';
import 'package:fruits_hub_app/features/on_boarding/presentation/widgets/indicator_and_button.dart';
import 'package:svg_flutter/svg.dart';

class CustomPageViewItem extends StatelessWidget {
  const CustomPageViewItem({
    super.key,
    required this.image,
    required this.backGroundImage,
    required this.subTitle,
    required this.title,
    this.isVisible,
    this.isVisible2,
  });
  final String image, backGroundImage;
  final String subTitle;
  final Widget title;
  final bool? isVisible;
  final bool? isVisible2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 2,
            child: Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(backGroundImage, fit: BoxFit.fill),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(image),
                ),
                Visibility(
                  visible: isVisible ?? false,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        SharedPrefSingleton.setBool(
                          kIsOnBoardingSeenBefore,
                          true,
                        );
                        Navigator.pushReplacementNamed(
                          context,
                          LoginViewPage.routeName,
                        );
                      },
                      child: Text(
                        tr("skip"),
                        style: AppTextStyle.regular12.copyWith(
                          color: AppColor.appDarkGrayColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Flexible(child: SizedBox(height: 64)),
          title,
          const Flexible(child: SizedBox(height: 24)),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: AppTextStyle.semiBold14.copyWith(
                color: AppColor.appDarkGrayColor,
              ),
            ),
          ),

          Flexible(child: const SizedBox(height: 64)),
          IndicatorAndButton(isVisible2: isVisible2),
        ],
      ),
    );
  }
}
