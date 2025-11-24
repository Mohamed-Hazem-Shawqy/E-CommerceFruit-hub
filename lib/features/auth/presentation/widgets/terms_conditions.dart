import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key, required this.onChangedTerms});
  final ValueChanged<bool> onChangedTerms;

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(9, 0),
      child: Row(
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            splashRadius: 0,
            activeColor: AppColor.appDarkGreenColor,
            side: BorderSide(color: AppColor.appGrayColor, strokeAlign: 4),
            value: isSelect,
            onChanged: (val) {
              isSelect = val!;
              widget.onChangedTerms(val);
              setState(() {});
            },
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'fromCreateAccount'.tr(),
                    style: AppTextStyle.semiBold14.copyWith(
                      color: AppColor.appGrayColor,
                    ),
                  ),
                  TextSpan(
                    text: 'termsAndConditions'.tr(),
                    style: AppTextStyle.semiBold14.copyWith(
                      color: AppColor.appGreenColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
