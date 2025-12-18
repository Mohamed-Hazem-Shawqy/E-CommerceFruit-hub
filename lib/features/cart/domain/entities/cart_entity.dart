import 'package:fruits_hub_app/core/entities/product_entity.dart';

class CartEntity {
  final ProductEntity productEntity;
  int count;

  CartEntity({required this.productEntity, this.count = 1});

  num calculateTotalPrice() {
    return count * num.parse(productEntity.price);
  }

  increaseCount() {
    count++;
  }

  decreaseCount() {
    count--;
  }
}
