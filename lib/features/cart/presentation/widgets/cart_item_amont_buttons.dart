import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';
import 'package:fruits_hub_app/features/cart/domain/entities/cart_entity.dart';
import 'package:fruits_hub_app/features/cart/presentation/manager/cubit/cart_item_cubit.dart';

class CartItemAmontButtons extends StatelessWidget {
  const CartItemAmontButtons({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CartItemCubit, CartItemState>(
        buildWhen: (previous, current) {
          if (current is CartItemUpdated) {
            if (current.cartEntity == cartEntity) {
              return true;
            }
          }
          return false;
        },
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10,
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: AppColor.appDarkGreenColor,
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    cartEntity.increaseCount();
                    context.read<CartItemCubit>().updatedCartItem(cartEntity);
                  },
                  icon: Icon(Icons.add, color: Colors.white),
                ),
              ),
              Text('${cartEntity.count}', style: AppTextStyle.bold16),
              CircleAvatar(
                radius: 12,
                backgroundColor: AppColor.appGreenColor.withValues(alpha: .2),
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    cartEntity.decreaseCount();
                    context.read<CartItemCubit>().updatedCartItem(cartEntity);
                  },
                  icon: Icon(Icons.remove, color: AppColor.appDarkGreenColor),
                ),
              ),
              const Spacer(),
              Text(
                "${cartEntity.calculateTotalPrice()} جنيه",
                style: AppTextStyle.bold16.copyWith(
                  color: AppColor.appOrangeColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
