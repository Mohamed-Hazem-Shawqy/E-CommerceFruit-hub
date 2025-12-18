import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_app/core/entities/product_entity.dart';
import 'package:fruits_hub_app/core/errors/failuer.dart';
import 'package:fruits_hub_app/core/models/product_model.dart';
import 'package:fruits_hub_app/core/repos/product_repo_decl.dart';
import 'package:fruits_hub_app/core/services/data_base_service.dart';

class ProductRepoImpl implements ProductRepoDecl {
  final DataBaseService dataBaseService;

  ProductRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failuer, List<ProductEntity>>> getBestSellingProduct() async {
    try {
      var data =
          await dataBaseService.getData(
                path: 'addProduct',
                query: {
                  'limit': 10,
                  'orderBy': "sellingCount",
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();

      return right(products);
    } catch (e) {
      log(e.toString());
      return left(ServerFailuer('Failed to get data'));
    }
  }

  @override
  Future<Either<Failuer, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await dataBaseService.getData(path: 'addProduct')
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();

      return right(products);
    } catch (e) {
      log(e.toString());
      return left(ServerFailuer('Failed to get data'));
    }
  }
}
