
import 'package:fruits_hub_app/core/entities/review_entity.dart';


class ProductEntity  {
  final String name, describtion;
  final String code, price;
  String? imageurl;
  final bool isFeatured;
  final int expireDate;
  final bool isOrganic;
  final int numberofCalories;
  final int forEachAmount;
  final num avgRating = 0;
  final num ratingCount = 0;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.name,
    required this.describtion,
    required this.code,
    required this.price,
    this.imageurl,
    required this.isFeatured,
    required this.expireDate,
    required this.numberofCalories,
    required this.forEachAmount,
    this.isOrganic = false, required this.reviews,
  });
}
