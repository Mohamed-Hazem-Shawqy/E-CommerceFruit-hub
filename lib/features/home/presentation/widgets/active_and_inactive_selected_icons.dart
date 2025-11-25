import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';
import 'package:fruits_hub_app/features/home/domain/entities/bottom_nav_bar_entity.dart';
import 'package:svg_flutter/svg.dart';

class InActiveIcon extends StatelessWidget {
  const InActiveIcon({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image);
  }
}

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({super.key, required this.image, required this.name});
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: ShapeDecoration(
          color: const Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: AppColor.appDarkGreenColor,
                shape: OvalBorder(),
              ),
              child: Center(child: SvgPicture.asset(image)),
            ),
            const SizedBox(width: 4),
            FittedBox(
              child: Text(
                '$name  ',
                style: AppTextStyle.semiBold11.copyWith(
                  color: AppColor.appDarkGreenColor,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarItems extends StatelessWidget {
  const NavBarItems({
    super.key,
    required this.bottomNavBarEntity,
    required this.isSelected,
  });
  final bool isSelected;
  final BottomNavBarEntity bottomNavBarEntity;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveIcon(
            image: bottomNavBarEntity.activeIcon,
            name: bottomNavBarEntity.name,
          )
        : InActiveIcon(image: bottomNavBarEntity.inActiveIcon);
  }
}
