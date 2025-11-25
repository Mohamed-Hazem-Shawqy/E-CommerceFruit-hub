import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';
import 'package:fruits_hub_app/core/widgets/notifcation_widget.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/more_beset_seller_body.dart';

class MoreBestSeller extends StatelessWidget {
  const MoreBestSeller({super.key});
  static const routeName = 'bestSeller';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('bestSeller'.tr(), style: AppTextStyle.bold19),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: const NotifcationWidget(),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(child: const MoreBesetSellerBody()),
        ],
      ),
    );
  }
}
