import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';
import 'package:fruits_hub_app/features/cart/domain/entities/cart_entity.dart';

class CartItemAmontButtons extends StatelessWidget {
  const CartItemAmontButtons({super.key, required this.cartEntity});
final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 10,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: AppColor.appDarkGreenColor,
            child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(Icons.add, color: Colors.white),
            ),
          ),
          Text('3', style: AppTextStyle.bold16),
          CircleAvatar(
            radius: 12,
            backgroundColor: AppColor.appGreenColor.withValues(alpha: .2),
            child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(Icons.remove, color: AppColor.appDarkGreenColor),
            ),
          ),
          const Spacer(),
          Text(
            "${cartEntity.calculateTotalPrice()} جنيه",
            style: AppTextStyle.bold16.copyWith(color: AppColor.appOrangeColor),
          ),
        ],
      ),
    );
  }
}
