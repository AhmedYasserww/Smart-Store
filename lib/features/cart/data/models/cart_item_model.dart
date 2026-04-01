// class CartItemModel {
//   final String id;
//   final String productId;
//   final int quantity;
//   final String color;
//   final String size;
//   final String poductName;
//   final String productImageUrl;
//
//   CartItemModel({
//     required this.id,
//     required this.productId,
//     required this.quantity,
//     required this.color,
//     required this.size,
//     required this.poductName,
//     required this.productImageUrl,
//   });
//
//   factory CartItemModel.fromJson(Map<String, dynamic> json) {
//     return CartItemModel(
//       id: json['id'],
//       productId: json['productId'],
//       quantity: json['quantity'],
//       color: json['color'],
//       size: json['size'],
//       poductName: json['poductName'],
//       productImageUrl: json['productImageUrl'] ?? '',
//     );
//   }
// }
//
// class AddToCartResponseModel {
//   final bool succeeded;
//   final String message;
//   final List<CartItemModel> items;
//
//   AddToCartResponseModel({
//     required this.succeeded,
//     required this.message,
//     required this.items,
//   });
//
//   factory AddToCartResponseModel.fromJson(Map<String, dynamic> json) {
//     final data = json['data'];
//     final itemsJson = data['items'] as List;
//     return AddToCartResponseModel(
//       succeeded: json['succeeded'],
//       message: json['message'],
//       items: itemsJson.map((e) => CartItemModel.fromJson(e)).toList(),
//     );
//   }
// }