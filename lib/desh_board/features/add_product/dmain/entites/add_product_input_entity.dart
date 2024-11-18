import 'dart:io';

class AddProductInputEntity {
  final String name;
  final num price;
  final String description;
  final String code;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  bool isOrganic = false;
  final int numberOfCalories;
  final int unitAmount;

  final num avgRating;
  final num ratingCount;

  AddProductInputEntity({
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
  });
}
