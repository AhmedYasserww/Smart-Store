part of 'top_selling_home_cubit.dart';

sealed class TopSellingHomeState {}

final class TopSellingHomeInitial extends TopSellingHomeState {}

final class TopSellingHomeLoading extends TopSellingHomeState {}

final class TopSellingHomeFailure extends TopSellingHomeState {
  final String errMessage;

  TopSellingHomeFailure({required this.errMessage});
}

final class TopSellingHomeSuccess extends TopSellingHomeState {
  final List<HomeProductModel> products;

  TopSellingHomeSuccess({required this.products});
}