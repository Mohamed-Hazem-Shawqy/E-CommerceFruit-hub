import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';

AppBar appBar(BuildContext context, {required String key}) {
  return AppBar(
    backgroundColor: Colors.white,
    // leading: IconButton(
    //   onPressed: () {
    //     Navigator.pop(context);
    //   },
    //   icon: Icon(Icons.arrow_back_ios_new_outlined),
    // ),
    centerTitle: true,
    title: Text(tr(key), style: AppTextStyle.bold18),
  );
}
