import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/cart/domain/entities/cart_entity.dart';
import 'package:fruits_hub_app/features/cart/presentation/widgets/cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartEntities});
  final List<CartEntity> cartEntities;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: cartEntities.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: CartItem(cartEntity: cartEntities[index]),
      ),
    );
  }
}
