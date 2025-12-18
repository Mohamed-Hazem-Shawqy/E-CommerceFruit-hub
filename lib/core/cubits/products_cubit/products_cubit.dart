import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/entities/product_entity.dart';
import 'package:fruits_hub_app/core/repos/product_repo_decl.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepoDecl) : super(ProductsInitial());
  final ProductRepoDecl productRepoDecl;
int productsLength=0;
  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productRepoDecl.getProducts();
    result.fold(
      (failuer) => emit(ProductsFailuer(errMessage: failuer.message)),
      (products) {
        productsLength=products.length;
        emit(ProductsSuccess(productEntity: products));
      },
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productRepoDecl.getBestSellingProduct();
    result.fold(
      (failuer) => emit(ProductsFailuer(errMessage: failuer.message)),
      (products) => emit(ProductsSuccess(productEntity: products)),
    );
  }
}
