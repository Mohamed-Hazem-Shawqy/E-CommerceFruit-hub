import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/helper_func/get_user.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';
import 'package:fruits_hub_app/core/widgets/notifcation_widget.dart';

PreferredSizeWidget? appBar() {
  return AppBar(
    title: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 3),
      leading: Image.asset(Assets.imagesProfilePicture),
      title: Text(
        'goodmorning'.tr(),
        style: AppTextStyle.regular16.copyWith(
          color: AppColor.appLightGrayColor,
        ),
      ),
      subtitle: Text(getUser().name, style: AppTextStyle.bold16),
      trailing: NotifcationWidget(),
    ),
  );
}
