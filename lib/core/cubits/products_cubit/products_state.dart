part of 'products_cubit.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductEntity> productEntity;

  const ProductsSuccess({required this.productEntity});
  @override
  List<Object> get props => [productEntity];
}

final class ProductsFailuer extends ProductsState {
  final String errMessage;

  const ProductsFailuer({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
