part of 'get_all_product_cubit.dart';

@immutable
sealed class GetAllProductState {}

final class GetAllProductInitial extends GetAllProductState {}

final class GetAllProductLoading extends GetAllProductState {}

final class GetAllProductSuccess extends GetAllProductState {
  final List<ProductModel> products;

  GetAllProductSuccess({required this.products});
}

final class GetAllProductFailure extends GetAllProductState {
  final String errorMessage;

  GetAllProductFailure({required this.errorMessage});
}