import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/entities/product_entity.dart';
import 'package:fruits_hub_app/features/cart/domain/entities/add_item_entity.dart';

part 'cart_cubit_state.dart';

class CartCubit extends Cubit<CartCubitState> {
  CartCubit() : super(CartCubitInitial());
  final AddCartItemEntity addItemEntity = AddCartItemEntity(cartEntityList: []);

  addCartItem(ProductEntity productEntity) {
    final isExsist = addItemEntity.isExsist(productEntity);
    final cartItem = addItemEntity.getCartItem(productEntity);
    if (isExsist) {
      cartItem.increaseCount();
    } else {
      addItemEntity.addCartItem(cartItem);
    }
    emit(CartCubitAddedItem());
  }
}
