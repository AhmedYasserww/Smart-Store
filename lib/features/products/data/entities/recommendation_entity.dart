// features/products/data/entities/recommendation_entity.dart

import '../models/product_model.dart';

class RecommendationEntity {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String similarityScore;
  final ProductModel product;

  RecommendationEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.similarityScore,
    required this.product,
  });
}