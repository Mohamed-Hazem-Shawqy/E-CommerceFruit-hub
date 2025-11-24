import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomModalProgressHud extends StatelessWidget {
  const CustomModalProgressHud({
    super.key,
    required this.inAsyncCall,
    required this.child,
  });
  final bool inAsyncCall;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const Center(
        child: CircularProgressIndicator(color: AppColor.appGreenColor),
      ),
      inAsyncCall: inAsyncCall,

      child: child,
    );
  }
}
