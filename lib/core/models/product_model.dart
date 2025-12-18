
import 'package:fruits_hub_app/core/entities/product_entity.dart';
import 'package:fruits_hub_app/core/models/review_model.dart';

class ProductModel {
  final String name, describtion;
  final String code, price;
  String? imageurl;
  final bool isFeatured;

  final int expireDate;
  final bool isOrganic;
  final int numberofCalories;
  final int forEachAmount;
  final num avgRating;
  final num ratingCount = 0;
  final List<ReviewModel> reviews;
  final int sellingCount;

  ProductModel({
    required this.name,
    required this.describtion,
    required this.code,
    required this.price,
    this.imageurl,
    required this.isFeatured,

    required this.expireDate,
    required this.numberofCalories,
    required this.forEachAmount,
    this.isOrganic = false,
    required this.reviews,
    this.sellingCount = 0,
    this.avgRating = 0,
  });

  factory ProductModel.fromEntity(ProductEntity productEntity) {
    return ProductModel(
      name: productEntity.name,
      describtion: productEntity.describtion,
      code: productEntity.code,
      price: productEntity.price,
      isFeatured: productEntity.isFeatured,
      imageurl: productEntity.imageurl,
      expireDate: productEntity.expireDate,
      numberofCalories: productEntity.numberofCalories,
      forEachAmount: productEntity.forEachAmount,
      isOrganic: productEntity.isOrganic,
      reviews: productEntity.reviews
          .map((model) => ReviewModel.fromEntity(model))
          .toList(),
    );
  }
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      describtion: json['describtion'],
      code: json['code'],
      price: json['price'],
      imageurl: json['imageurl'],
      isFeatured: json['isFeatured'],
      expireDate: json['expireDate'],
      numberofCalories: json['numberofCalories'],
      forEachAmount: json['forEachAmount'],
      isOrganic: json['isOrganic'] ?? false,

      reviews: (json['reviews'] as List)
          .map((e) => ReviewModel.fromJson(e))
          .toList(),

      sellingCount: json['sellingCount'] ?? 0,
      
    );
  }
  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      describtion: describtion,
      code: code,
      price: price,
      imageurl: imageurl,
      isFeatured: isFeatured,
      expireDate: expireDate,
      numberofCalories: numberofCalories,
      forEachAmount: forEachAmount,
      isOrganic: isOrganic,
      reviews: reviews.map((model) => model.toEntity()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'describtion': describtion,
      'price': price,
      'imageurl': imageurl,
      "isFeatured": isFeatured,
      "isOrganic": isOrganic,
      "numberofCalories": numberofCalories,
      "forEachAmount": forEachAmount,
      "expireDate": expireDate,
      "reviews": reviews.map((e) => e.toJson()).toList(),
      "sellingCount": sellingCount,
    };
  }
}
