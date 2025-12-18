import 'package:fruits_hub_app/core/entities/review_entity.dart';

class ReviewModel {
  final String name, image, reviewDescribtion, date;
  final num ratting;

  ReviewModel({
    required this.name,
    required this.image,
    required this.reviewDescribtion,
    required this.date,
    required this.ratting,
  });
  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      reviewDescribtion: reviewEntity.reviewDescribtion,
      date: reviewEntity.date,
      ratting: reviewEntity.ratting,
    );
  }
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'] as String,
      image: json['image'] as String,
      reviewDescribtion: json['reviewDescribtion'] as String,
      date: json['date'] as String,
      ratting: json['ratting'] as num,
    );
  }
  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      image: image,
      reviewDescribtion: reviewDescribtion,
      date: date,
      ratting: ratting,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "reviewDescribtion": reviewDescribtion,
      "date": date,
      "ratting": ratting,
    };
  }
}
