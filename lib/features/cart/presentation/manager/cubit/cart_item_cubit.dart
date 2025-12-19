import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/features/cart/domain/entities/cart_entity.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  updatedCartItem(CartEntity cartEntity) {
    emit(CartItemUpdated(cartEntity: cartEntity));
  }
}
