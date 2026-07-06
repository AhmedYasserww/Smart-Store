class HomeProductModel {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String categoryName;
  final bool isFavorite;
  final double? averageRating;
  final List<String> colors;

  HomeProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.categoryName,
    required this.isFavorite,
    this.averageRating,
    required this.colors,
  });

  factory HomeProductModel.fromJson(Map<String, dynamic> data) {
    return HomeProductModel(
      id: data["id"]?.toString() ?? "",
      name: data["name"] ?? "",
      price: (data["price"] ?? 0).toDouble(),
      imageUrl: data["imageUrl"] ?? "",
      categoryName: data["categoryName"] ?? "",
      isFavorite: data["isFavorite"] ?? false,
      averageRating: (data["averageRating"] as num?)?.toDouble(),
      colors:
          (data["colors"] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}
