import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/entities/product_entity.dart';
import 'package:fruits_hub_app/core/utils/app_color.dart';
import 'package:fruits_hub_app/core/utils/app_text_style.dart';
import 'package:fruits_hub_app/features/cart/presentation/manager/cart_cubit/cart_cubit_cubit.dart';

class FruitProduct extends StatelessWidget {
  const FruitProduct({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border_outlined),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Expanded(
                  child: productEntity.imageurl != null
                      ? SizedBox(
                          height: 150,
                          width: 120,
                          child: Image.network(
                            productEntity.imageurl!,
                            fit: BoxFit.fill,
                          ),
                        )
                      : Container(color: Colors.grey, width: 100, height: 100),
                ),
                const SizedBox(height: 10),
                ListTile(
                  title: Text(
                    productEntity.name,
                    style: AppTextStyle.semiBold16,
                  ),
                  subtitle: FittedBox(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${productEntity.price} جنيه ',
                            style: AppTextStyle.bold13.copyWith(
                              color: AppColor.appOrangeColor,
                            ),
                          ),
                          TextSpan(
                            text: '/',
                            style: AppTextStyle.bold13.copyWith(
                              color: AppColor.appOrangeColor,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: AppTextStyle.semiBold13.copyWith(
                              color: AppColor.appOrangeColor,
                            ),
                          ),
                          TextSpan(
                            text: 'الكيلو',
                            style: AppTextStyle.semiBold13.copyWith(
                              color: AppColor.appLightOrangeColor,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  trailing: productEntity.imageurl != null
                      ? GestureDetector(
                        onTap: () {
                          context.read<CartCubit>().addCartItem(productEntity);
                        },
                        child: CircleAvatar(
                            backgroundColor: AppColor.appDarkGreenColor,
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                      )
                      : CircleAvatar(),
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
