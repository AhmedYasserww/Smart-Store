
import '../entities/recommendation_entity.dart';
import 'product_model.dart';

class RecommendationModel extends RecommendationEntity {
  RecommendationModel({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    required super.similarityScore,
    required super.product,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] ?? '',
      similarityScore: json['similarityScore'] ?? '',
      product: ProductModel.fromJson(json['_Product']),
    );
  }
}