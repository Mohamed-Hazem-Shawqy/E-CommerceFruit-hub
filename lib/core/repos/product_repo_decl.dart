import 'package:dartz/dartz.dart';
import 'package:fruits_hub_app/core/entities/product_entity.dart';
import 'package:fruits_hub_app/core/errors/failuer.dart';

abstract class ProductRepoDecl {

  Future<Either<Failuer,List<ProductEntity>>> getProducts();
  Future<Either<Failuer,List<ProductEntity>>> getBestSellingProduct();
}