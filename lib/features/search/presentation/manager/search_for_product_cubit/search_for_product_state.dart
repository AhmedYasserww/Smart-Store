part of 'search_for_product_cubit.dart';

@immutable
abstract class SearchForProductState {}

class SearchForProductInitial extends SearchForProductState {}
class SearchForProductLoading extends SearchForProductState {}
class SearchForProductSuccess extends SearchForProductState {
  final List<ProductModel>product;

  SearchForProductSuccess({required this.product});
}
class SearchForProductFailure extends SearchForProductState {
  final String errorMessage;

  SearchForProductFailure({required this.errorMessage});
}



