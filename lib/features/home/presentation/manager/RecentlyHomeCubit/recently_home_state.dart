part of 'recently_home_cubit.dart';

sealed class RecentlyHomeState {}

final class RecentlyHomeInitial extends RecentlyHomeState {}

final class RecentlyHomeLoading extends RecentlyHomeState {}

final class RecentlyHomeFailure extends RecentlyHomeState {
  final String errMessage;

  RecentlyHomeFailure({required this.errMessage});
}

final class RecentlyHomeSuccess extends RecentlyHomeState {
  final List<HomeProductModel> products;

  RecentlyHomeSuccess({required this.products});
}
