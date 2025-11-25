import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';

class BottomNavBarEntity {
  final String activeIcon, inActiveIcon, name;

  BottomNavBarEntity({
    required this.activeIcon,
    required this.inActiveIcon,
    required this.name,
  });
  static List<BottomNavBarEntity> bottomNavBarItems(BuildContext context) {
  return [
    BottomNavBarEntity(
      activeIcon: Assets.imagesNavBottomFilledHome,
      inActiveIcon: Assets.imagesNavBottomHome,
      name: 'home'.tr(),
    ),
    BottomNavBarEntity(
      activeIcon: Assets.imagesNavBottomFilledProdutct,
      inActiveIcon: Assets.imagesNavBottomProduct,
      name: 'product'.tr(),
    ),
    BottomNavBarEntity(
      activeIcon: Assets.imagesNavBottomFilledCart,
      inActiveIcon: Assets.imagesNavBottomCart,
      name: 'cart'.tr(),
    ),
    BottomNavBarEntity(
      activeIcon: Assets.imagesNavBottomFilledProfile,
      inActiveIcon: Assets.imagesNavBottomProfile,
      name: 'profile'.tr(),
    ),
  ];
}

}

