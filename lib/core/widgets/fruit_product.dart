import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';
import 'package:svg_flutter/svg.dart';

class FruitProduct extends StatelessWidget {
  const FruitProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border_outlined),
          ),
          Positioned.fill(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(
                    top: MediaQuery.heightOf(context) / 20,
                  ),
                  child: SvgPicture.asset(
                    Assets.imagesOnBoardingImage2,
                    width: 100,
                  ),
                ),
                const Spacer(),
                ListTile(
                  title: Text('اناناس', style: AppTextStyle.semiBold16),
                  subtitle: FittedBox(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '30جنية ',
                            style: AppTextStyle.bold13.copyWith(
                              color: AppColor.appOrangeColor,
                            ),
                          ),
                          TextSpan(
                            text: '/',
                            style: AppTextStyle.bold13.copyWith(
                              color: AppColor.appOrangeColor,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: AppTextStyle.semiBold13.copyWith(
                              color: AppColor.appOrangeColor,
                            ),
                          ),
                          TextSpan(
                            text: 'الكيلو',
                            style: AppTextStyle.semiBold13.copyWith(
                              color: AppColor.appLightOrangeColor,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: AppColor.appDarkGreenColor,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
