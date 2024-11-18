import 'dart:io';

class AddProductInputEntity {
  final String name;
  final num price;
  final String description;
  final String code;
  final File image;
  final bool isFeatured;
   String? imageUrl;

  AddProductInputEntity({
    required this.name,
    required this.price,
    required this.description,
    required this.code,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
  });
}
