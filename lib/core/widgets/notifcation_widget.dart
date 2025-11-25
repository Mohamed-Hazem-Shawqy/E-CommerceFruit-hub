import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:svg_flutter/svg.dart';

class NotifcationWidget extends StatelessWidget {
  const NotifcationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColor.appGreenColor.withValues(alpha: .2),
      child: SvgPicture.asset(Assets.imagesNotification),
    );
  }
}
