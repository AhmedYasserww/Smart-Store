import 'package:equatable/equatable.dart';

class ProductQueryParams extends Equatable {
  const ProductQueryParams({
    this.pageNumber,
    this.pageSize,
    this.maxPrice,
    this.minPrice,
    this.categoryId,
    this.color,
    this.sizeIds = const [],
    this.rating,
  });

  final int? pageNumber;
  final int? pageSize;
  final int? maxPrice;
  final int? minPrice;
  final String? categoryId;
  final String? color;
  final List<String> sizeIds;
  final int? rating;

  ProductQueryParams copyWith({
    int? pageNumber,
    int? pageSize,
    int? maxPrice,
    int? minPrice,
    String? categoryId,
    String? color,
    List<String>? sizeIds,
    int? rating,
    bool clearCategoryId = false,
    bool clearColor = false,
    bool clearSizeIds = false,
    bool clearRating = false,
  }) {
    return ProductQueryParams(
      pageNumber: pageNumber ?? this.pageNumber,
      pageSize: pageSize ?? this.pageSize,
      maxPrice: maxPrice ?? this.maxPrice,
      minPrice: minPrice ?? this.minPrice,
      categoryId: clearCategoryId ? null : (categoryId ?? this.categoryId),
      color: clearColor ? null : (color ?? this.color),
      sizeIds: clearSizeIds ? const [] : (sizeIds ?? this.sizeIds),
      rating: clearRating ? null : (rating ?? this.rating),
    );
  }

  Map<String, dynamic> toQueryParameters() {
    final query = <String, dynamic>{};

    if (pageNumber != null) query['PageNumber'] = pageNumber;
    if (pageSize != null) query['PageSize'] = pageSize;
    if (maxPrice != null) query['MaxPrice'] = maxPrice;
    if (minPrice != null) query['MinPrice'] = minPrice;
    if (categoryId != null && categoryId!.isNotEmpty) {
      query['CategoryId'] = categoryId;
    }
    if (color != null && color!.isNotEmpty) query['Color'] = color;
    if (sizeIds.isNotEmpty) query['SizeIds'] = sizeIds;
    if (rating != null) query['Rating'] = rating;

    return query;
  }

  @override
  List<Object?> get props => [
    pageNumber,
    pageSize,
    maxPrice,
    minPrice,
    categoryId,
    color,
    sizeIds,
    rating,
  ];
}
