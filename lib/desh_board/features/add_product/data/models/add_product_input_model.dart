// import 'dart:io';

import 'package:e_commerce/desh_board/features/add_product/data/models/review_model.dart';
import 'package:e_commerce/desh_board/features/add_product/dmain/entites/add_product_input_entity.dart';

class ProductModel implements ProductEntity {
  final String name;
  final num price;
  final String description;
  final String code;
  // final File image;
  final bool isFeatured;
  // String? imageUrl;
  final int expirationMonths;
  bool isOrganic = false;
  final int numberOfCalories;
  final int unitAmount;

  final num avgRating;
  final num ratingCount;
  final List<ReviewModel> reviews;
  final int sellingCount;

  ProductModel({
    required this.name,
    required this.price,
    required this.description,
    required this.code,
    // required this.image,
    required this.isFeatured,
    // this.imageUrl,
    required this.expirationMonths,
    this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitAmount,
    this.avgRating = 0,
    this.ratingCount = 0,
    required this.reviews,
    this.sellingCount = 0,
  });

  factory ProductModel.fromEntity(ProductEntity addProductInputEntity) {
    return ProductModel(
      name: addProductInputEntity.name,
      price: addProductInputEntity.price,
      description: addProductInputEntity.description,
      code: addProductInputEntity.code,
      isFeatured: addProductInputEntity.isFeatured,
      expirationMonths: addProductInputEntity.expirationMonths,
      isOrganic: addProductInputEntity.isOrganic,
      numberOfCalories: addProductInputEntity.numberOfCalories,
      unitAmount: addProductInputEntity.unitAmount,
      avgRating: addProductInputEntity.avgRating,
      ratingCount: addProductInputEntity.ratingCount,
      reviews: addProductInputEntity.reviews
          .map((review) => ReviewModel.fromEntity(review))
          .toList(),
    );
  }
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      code: json['code'],
      // image: File.fromUri(Uri.parse(json['image'])),
      isFeatured: json['isFeatured'],
      // imageUrl: json['imageUrl'],
      expirationMonths: json['expirationMonths'],
      isOrganic: json['isOrganic'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      avgRating: json['avgRating'],
      ratingCount: json['ratingCount'],
      reviews: json['reviews']
         .map((review) => ReviewModel.fromJson(review))
         .toList(),
      sellingCount: json['sellingCount'],
    );
  }
  toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'code': code,
      // 'image': imageUrl,
      'isFeatured': isFeatured,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'expirationMonths': expirationMonths,
      'reviews': reviews.map((review) => review.toJson()).toList(),
      'sellingCount': sellingCount,
    };
  }
}
