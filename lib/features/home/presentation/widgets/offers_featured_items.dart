import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';
import 'package:svg_flutter/svg_flutter.dart';

class OffersFeaturedItems extends StatelessWidget {
  const OffersFeaturedItems({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width;
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(4),
      child: Container(
        color: const Color.fromARGB(255, 248, 247, 247),
        width: itemWidth,

        child: AspectRatio(
          aspectRatio: 324 / 158,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                right: itemWidth / 2.7,
                child: SvgPicture.asset(
                  Assets.imagesOnBoardingImage1,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: itemWidth / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: svg.Svg(Assets.imagesOffersBackground),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 33.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      const SizedBox(height: 25),

                      Text(
                        'عروض العيد',
                        style: AppTextStyle.regular13.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'خصم 25% ',
                        style: AppTextStyle.bold19.copyWith(
                          color: Colors.white,
                        ),
                      ),

                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(4),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'shopNow'.tr(),
                          style: AppTextStyle.bold13.copyWith(
                            color: AppColor.appDarkGreenColor,
                          ),
                        ),
                      ),
                      const Flexible(child: SizedBox(height: 29)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
