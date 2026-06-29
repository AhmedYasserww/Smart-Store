part of 'get_recommendations_cubit.dart';

@immutable
sealed class GetRecommendationsState {}

class GetRecommendationsInitial extends GetRecommendationsState {}
class GetRecommendationsLoading extends GetRecommendationsState {}

class GetRecommendationsSuccess extends GetRecommendationsState {
  final List<RecommendationEntity> recommendations;
  GetRecommendationsSuccess({required this.recommendations});
}

class GetRecommendationsFailure extends GetRecommendationsState {
  final String errorMessage;
  GetRecommendationsFailure({required this.errorMessage});
}