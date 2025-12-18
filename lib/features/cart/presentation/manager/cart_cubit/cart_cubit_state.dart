part of 'cart_cubit_cubit.dart';

sealed class CartCubitState {
  const CartCubitState();
}

final class CartCubitInitial extends CartCubitState {}

final class CartCubitAddedItem extends CartCubitState {}

final class CartCubitRemoveItem extends CartCubitState {}
