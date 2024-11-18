import 'dart:io';

import 'package:e_commerce/desh_board/features/add_product/dmain/entites/add_product_input_entity.dart';

class AddProductInputModel implements AddProductInputEntity {
  final String name;
  final num price;
  final String description;
  final String code;
  final File image;
  final bool isFeatured;
  String? imageUrl;

  AddProductInputModel({
    required this.name,
    required this.price,
    required this.description,
    required this.code,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
  });

  factory AddProductInputModel.fromEntity(
      AddProductInputEntity addProductInputEntity) {
    return AddProductInputModel(
      name: addProductInputEntity.name,
      price: addProductInputEntity.price,
      description: addProductInputEntity.description,
      code: addProductInputEntity.code,
      image: addProductInputEntity.image,
      isFeatured: addProductInputEntity.isFeatured,
      imageUrl: addProductInputEntity.imageUrl,
    );
  }
  toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'code': code,
      'image': imageUrl,
      'isFeatured': isFeatured
    };
  }
}
