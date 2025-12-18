import 'package:fruits_hub_app/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: "تفاح أحمر",
    describtion: "تفاح طازج غني بالفيتامينات",
    code: "APL123",
    isOrganic: true,
    price: "25",
    isFeatured: true,
    expireDate: 15,
    numberofCalories: 95,
    forEachAmount: 10,
    reviews: [],
    imageurl: null,
  );
}

List<ProductEntity> getListOfDummyProduct() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
