import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';
import 'package:fruits_hub_app/features/cart/presentation/manager/cart_cubit/cart_cubit_cubit.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(color: const Color(0xFFEBF9F1)),
      child: Center(
        child: Text(
          'لديك ${context.watch<CartCubit>().addItemEntity.cartEntityList.length} منتجات في سله التسوق',
          style: AppTextStyle.regular14.copyWith(
            color: AppColor.appDarkGreenColor,
          ),
        ),
      ),
    );
  }
}
