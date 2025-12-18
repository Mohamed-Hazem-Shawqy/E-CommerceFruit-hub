import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/entities/product_entity.dart';
import 'package:fruits_hub_app/core/widgets/fruit_product.dart';

class ProductsBody extends StatelessWidget {
  const ProductsBody({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) =>
          FruitProduct(productEntity: products[index]),
    );
  }
}
