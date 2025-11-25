import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/widgets/fruit_product.dart';

class MoreBesetSellerBody extends StatelessWidget {
  const MoreBesetSellerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 16,
          mainAxisSpacing: 8,
          crossAxisCount: 2,
          childAspectRatio: 163 / 214,
        ),
        itemCount: 10,
        itemBuilder: (context, index) => FruitProduct(),
      ),
    );
  }
}
