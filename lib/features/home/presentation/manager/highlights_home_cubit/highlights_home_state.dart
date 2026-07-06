part of 'highlights_home_cubit.dart';

sealed class HighlightsHomeState {}

final class HighlightsHomeInitial extends HighlightsHomeState {}

final class HighlightsHomeLoading extends HighlightsHomeState {}

final class HighlightsHomeFailure extends HighlightsHomeState {
  final String errMessage;

  HighlightsHomeFailure({required this.errMessage});
}

final class HighlightsHomeSuccess extends HighlightsHomeState {
  final List<HomeProductModel> products;

  HighlightsHomeSuccess({required this.products});
}
