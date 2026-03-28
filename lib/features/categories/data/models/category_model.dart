import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  const CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryImageUrl,
  });

  final String id;
  final String name;
  final String description;
  final String categoryImageUrl;

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      categoryImageUrl: json['categoryImageUrl']?.toString() ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name, description, categoryImageUrl];
}
