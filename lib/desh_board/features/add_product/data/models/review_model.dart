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
    name: json['name'] as String? ?? '',
    image: json['image'] as String? ?? '',
    date: json['date'] as String? ?? '',
    reviewDescription: json['reviewDescription'] as String? ?? '',
    ratting: json['ratting'] is num ? (json['ratting'] as num).toDouble() : 0.0,
  );
}


 Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'date': date,
      'reviewDescription': reviewDescription,
      'ratting': ratting,
    };
  }
}
