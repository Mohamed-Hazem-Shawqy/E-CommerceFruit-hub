import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/widgets/fruit_product.dart';

class BestSellerGridView extends StatelessWidget {
  const BestSellerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
      ),
      itemCount: 4,
      itemBuilder: (context, index) => FruitProduct(),
    );
  }
}
