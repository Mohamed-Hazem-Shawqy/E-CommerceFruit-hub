import 'package:fruits_hub_app/core/entities/product_entity.dart';
import 'package:fruits_hub_app/features/cart/domain/entities/cart_entity.dart';

class AddCartItemEntity {
  final List<CartEntity> cartEntityList;

  AddCartItemEntity({required this.cartEntityList});

  addCartItem(CartEntity cartEntity) {
    cartEntityList.add(cartEntity);
  }

  deleteCartItem(CartEntity cartEntity) {
    cartEntityList.remove(cartEntity);
  }

  double calculateAllTotalPrice() {
    double total = 0;
    for (var element in cartEntityList) {
      total += element.calculateTotalPrice();
    }
    return total;
  }

  bool isExsist(ProductEntity productEntity) {
    for (var element in cartEntityList) {
      if (element.productEntity == productEntity) {
        return true;
      }
    }
    return false;
  }

  CartEntity getCartItem(ProductEntity productEntity) {
    for (var element in cartEntityList) {
      if (element.productEntity == productEntity) {
        return element;
      }
    }
    return CartEntity(productEntity: productEntity, count: 1);
  }
}
