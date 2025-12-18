import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/widgets/custom_button.dart';
import 'package:fruits_hub_app/features/cart/presentation/manager/cart_cubit/cart_cubit_cubit.dart';
import 'package:fruits_hub_app/features/cart/presentation/widgets/cart_header.dart';
import 'package:fruits_hub_app/features/cart/presentation/widgets/cart_item_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CartHeader(),
        SizedBox(height: 16),

        context.read<CartCubit>().addItemEntity.cartEntityList.isNotEmpty
            ? const Divider()
            : const SizedBox(),
        const SizedBox(height: 16),

        Expanded(
          child: CartItemList(
            cartEntities: context
                .read<CartCubit>()
                .addItemEntity
                .cartEntityList,
          ),
        ),

        context.read<CartCubit>().addItemEntity.cartEntityList.isNotEmpty
            ? const Divider()
            : const SizedBox(),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 80.0,
            top: 40,
            left: 20,
            right: 20,
          ),
          child:
              context.read<CartCubit>().addItemEntity.cartEntityList.isNotEmpty
              ? CustomButton(
                  text:
                      'الدفع ${context.watch<CartCubit>().addItemEntity.calculateAllTotalPrice()} جنيه',
                  onPressed: () {},
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
