import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/helper_func/get_user.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            UserUiData(userEntity: getUser().name),
            UserUiData(userEntity: getUser().email),
          ],
        ),
      ),
    );
  }
}

class UserUiData extends StatelessWidget {
  const UserUiData({super.key, required this.userEntity});
  final String userEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: AppColor.appDarkGreenColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        userEntity,
        style: AppTextStyle.semiBold14.copyWith(color: Colors.white),
      ),
    );
  }
}
