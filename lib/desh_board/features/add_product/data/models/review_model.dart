import 'package:e_commerce/desh_board/features/add_product/dmain/entites/review_entity.dart';

class ReviewModel implements ReviewEntity {
  final String name;
  final String image;
  final String date;
  final String reviewDescription;
  final num ratting;

  ReviewModel({
    required this.name,
    required this.image,
    required this.date,
    required this.reviewDescription,
    required this.ratting,
  });

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      date: reviewEntity.date,
      reviewDescription: reviewEntity.reviewDescription,
      ratting: reviewEntity.ratting,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      date: json['date'],
      reviewDescription: json['reviewDescription'],
      ratting: json['ratting'],
    );
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'date': date,
      'reviewDescription': reviewDescription,
      'ratting': ratting,
    };
  }
}
