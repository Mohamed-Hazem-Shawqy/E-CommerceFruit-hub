import 'package:equatable/equatable.dart';
import 'package:fruits_hub_app/core/entities/product_entity.dart';

class CartEntity extends Equatable {
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
    if (count != 1) {
      count--;
    } else {
      count = 1;
    }
  }

  @override
  List<Object?> get props => [productEntity];
}
