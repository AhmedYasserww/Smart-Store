// data/models/product_model.dart
import 'package:equatable/equatable.dart';

class ProductImageModel extends Equatable {
  final String id;
  final String altText;
  final bool isPrimary;
  final String images;

  const ProductImageModel({
    required this.id,
    required this.altText,
    required this.isPrimary,
    required this.images,
  });

  factory ProductImageModel.fromJson(Map<String, dynamic> json) {
    return ProductImageModel(
      id: json["id"],
      altText: json["altText"] ?? "",
      isPrimary: json["isPrimary"] ?? false,
      images: json["images"] ?? "",
    );
  }

  @override
  List<Object?> get props => [id, altText, isPrimary, images];
}

class ProductSizeModel extends Equatable {
  final String sizeId;
  final String sizeName;
  final int quantity;

  const ProductSizeModel({
    required this.sizeId,
    required this.sizeName,
    required this.quantity,
  });

  factory ProductSizeModel.fromJson(Map<String, dynamic> json) {
    return ProductSizeModel(
      sizeId: json["sizeId"],
      sizeName: json["sizeName"] ?? "",
      quantity: json["quantity"] ?? 0,
    );
  }

  @override
  List<Object?> get props => [sizeId, sizeName, quantity];
}

class ProductModel extends Equatable {
  final String id;
  final String sellerId;
  final String categoryId;
  final String name;
  final String description;
  final double price;
  final int stockQuantity;
  final String createdAt;
  final bool isActive;
  final String categoryName;
  final bool isFavorite;
  final double rating;
  final int reviews;
  final List<ProductImageModel> productImages;
  final List<ProductSizeModel> productSizes;

  const ProductModel({
    required this.id,
    required this.sellerId,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
    required this.stockQuantity,
    required this.createdAt,
    required this.isActive,
    required this.categoryName,
    required this.isFavorite,
    required this.rating,
    required this.reviews,
    required this.productImages,
    required this.productSizes,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      sellerId: json["sellerId"],
      categoryId: json["categoryId"],
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      price: (json["price"] ?? 0).toDouble(),
      stockQuantity: json["stockQuantity"] ?? 0,
      createdAt: json["createdAt"] ?? "",
      isActive: json["isActive"] ?? false,
      categoryName: json["categoryName"] ?? "",
      isFavorite: json["isFavorite"] ?? false,
      rating: (json["rating"] ?? 0).toDouble(),
      reviews: json["reviews"] ?? 0,
      productImages: (json["productImages"] as List<dynamic>?)
          ?.map((e) => ProductImageModel.fromJson(e))
          .toList() ??
          [],
      productSizes: (json["productSizes"] as List<dynamic>?)
          ?.map((e) => ProductSizeModel.fromJson(e))
          .toList() ??
          [],
    );
  }

  @override
  List<Object?> get props => [id, name, price, productImages, productSizes];
}

class ProductsResponse {
  final List<ProductModel> items;
  final int pageSize;
  final int pageNumber;
  final int count;
  final int totalPage;
  final bool hasPreviousPages;
  final bool hasNextPage;

  ProductsResponse({
    required this.items,
    required this.pageSize,
    required this.pageNumber,
    required this.count,
    required this.totalPage,
    required this.hasPreviousPages,
    required this.hasNextPage,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    final data = json["data"] ?? {};
    final itemsList = (data["items"] as List<dynamic>?)
        ?.map((e) => ProductModel.fromJson(e))
        .toList() ??
        [];
    return ProductsResponse(
      items: itemsList,
      pageSize: data["pageSize"] ?? 0,
      pageNumber: data["pageNumber"] ?? 0,
      count: data["count"] ?? 0,
      totalPage: data["totalPage"] ?? 0,
      hasPreviousPages: data["hasPreviousPages"] ?? false,
      hasNextPage: data["hasNextPage"] ?? false,
    );
  }
}