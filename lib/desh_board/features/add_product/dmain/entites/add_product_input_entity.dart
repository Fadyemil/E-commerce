import 'dart:io';

import 'review_entity.dart';

class ProductEntity {
  final String name;
  final num price;
  final String description;
  final String code;
  File? image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  bool isOrganic = false;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating;
  final num ratingCount;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.name,
    required this.price,
    required this.description,
    required this.code,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
    this.ratingCount = 0,
    this.avgRating = 0,
    required this.reviews,
  });

  ProductEntity copyWith({
    String? name,
    num? price,
    String? description,
    String? code,
    File? image,
    bool? isFeatured,
    String? imageUrl,
    int? expirationMonths,
    bool? isOrganic,
    int? numberOfCalories,
    int? unitAmount,
    num? avgRating,
    num? ratingCount,
    List<ReviewEntity>? reviews,
  }) {
    return ProductEntity(
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      code: code ?? this.code,
      image: image ?? this.image,
      isFeatured: isFeatured ?? this.isFeatured,
      imageUrl: imageUrl ?? this.imageUrl,
      expirationMonths: expirationMonths ?? this.expirationMonths,
      isOrganic: isOrganic ?? this.isOrganic,
      numberOfCalories: numberOfCalories ?? this.numberOfCalories,
      unitAmount: unitAmount ?? this.unitAmount,
      avgRating: avgRating ?? this.avgRating,
      ratingCount: ratingCount ?? this.ratingCount,
      reviews: reviews ?? this.reviews,
    );
  }
}
