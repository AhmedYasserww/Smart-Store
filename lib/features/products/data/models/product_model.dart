// data/models/product_model.dart
import 'package:equatable/equatable.dart';

class ProductImageModel extends Equatable {
  final String altText;
  final bool isPrimary;
  final String images;

  const ProductImageModel({
    required this.altText,
    required this.isPrimary,
    required this.images,
  });

  factory ProductImageModel.fromJson(Map<String, dynamic> json) {
    return ProductImageModel(
      altText: json["altText"] ?? "",
      isPrimary: json["isPrimary"] ?? false,
      images: json["images"] ?? "",
    );
  }

  @override
  List<Object?> get props => [altText, isPrimary, images];
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
      sizeId: json["sizeId"] ?? "",
      sizeName: json["sizeName"] ?? "",
      quantity: json["quantity"] ?? 0,
    );
  }

  @override
  List<Object?> get props => [sizeId, sizeName, quantity];
}

class ClientProductRatingModel extends Equatable {
  final String clientId;
  final String productId;
  final double rating;
  final String comment;
  final String ratedAt;
  final String updatedAt;

  const ClientProductRatingModel({
    required this.clientId,
    required this.productId,
    required this.rating,
    required this.comment,
    required this.ratedAt,
    required this.updatedAt,
  });

  factory ClientProductRatingModel.fromJson(Map<String, dynamic> json) {
    return ClientProductRatingModel(
      clientId: json["clientId"]?.toString() ?? "",
      productId: json["productId"]?.toString() ?? "",
      rating: (json["rating"] ?? 0).toDouble(),
      comment: json["comment"] ?? "",
      ratedAt: json["ratedAt"] ?? "",
      updatedAt: json["updatedAt"] ?? "",
    );
  }

  @override
  List<Object?> get props => [clientId, productId, rating, comment, ratedAt, updatedAt];
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
  final List<String> colors; // <-- تم التغيير من color إلى List<String>
  final double rating;
  final int reviews;
  final List<ProductImageModel> productImages;
  final List<ClientProductRatingModel> clientProductRatings;
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
    required this.colors,
    required this.rating,
    required this.reviews,
    required this.productImages,
    required this.clientProductRatings,
    required this.productSizes,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final ratingsList = (json["clientProductRatings"] as List<dynamic>?)
        ?.map((e) => ClientProductRatingModel.fromJson(e))
        .toList() ??
        [];

    final fallbackRating = ratingsList.isEmpty
        ? 0.0
        : ratingsList.map((e) => e.rating).reduce((a, b) => a + b) /
        ratingsList.length;

    return ProductModel(
      id: json["id"]?.toString() ?? "",
      sellerId: json["sellerId"]?.toString() ?? "",
      categoryId: json["categoryId"]?.toString() ?? "",
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      price: (json["price"] ?? 0).toDouble(),
      stockQuantity: json["stockQuantity"] ?? 0,
      createdAt: json["createdAt"] ?? "",
      isActive: json["isActive"] ?? false,
      categoryName: json["categoryName"] ?? "",
      isFavorite: json["isFavorite"] ?? false,
      colors: (json["colors"] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      rating: json["rating"] != null
          ? (json["rating"] ?? 0).toDouble()
          : fallbackRating,
      reviews: json["reviews"] ?? ratingsList.length,
      productImages: (json["productImages"] as List<dynamic>?)
          ?.map((e) => ProductImageModel.fromJson(e))
          .toList() ??
          [],
      clientProductRatings: ratingsList,
      productSizes: (json["productSizes"] as List<dynamic>?)
          ?.map((e) => ProductSizeModel.fromJson(e))
          .toList() ??
          [],
    );
  }

  @override
  List<Object?> get props => [id, name, price, productImages, productSizes, colors];
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
    final itemsList =
        (data["items"] as List<dynamic>?)?.map((e) => ProductModel.fromJson(e)).toList() ?? [];
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