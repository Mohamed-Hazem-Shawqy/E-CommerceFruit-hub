import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';
import 'package:fruits_hub_app/features/cart/domain/entities/cart_entity.dart';
import 'package:fruits_hub_app/features/cart/presentation/widgets/cart_item_amont_buttons.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.widthOf(context) / 4.5,
          height: MediaQuery.heightOf(context) / 9.5,
          color: Color(0xfff3f5f7),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
              cartEntity.productEntity.imageurl!,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(width: 17),
        Expanded(
          child: Column(
            spacing: 6,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    cartEntity.productEntity.name,
                    style: AppTextStyle.bold13,
                  ),
                  const Spacer(),
                  SvgPicture.asset(Assets.imagesTrash),
                ],
              ),
              Text(
                '${cartEntity.count} كم',
                style: AppTextStyle.regular13.copyWith(
                  color: AppColor.appLightOrangeColor,
                ),
              ),
              const SizedBox(height: 6),
              Row(children: [CartItemAmontButtons(cartEntity: cartEntity)]),
            ],
          ),
        ),
      ],
    );
  }
}
