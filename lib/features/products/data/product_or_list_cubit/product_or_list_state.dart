part of 'product_or_list_cubit.dart';

@immutable
sealed class ProductOrListState {}

final class ProductOrListInitial extends ProductOrListState {}
final class ProductOrListProduct extends ProductOrListState {}
final class ProductOrList extends ProductOrListState {}
