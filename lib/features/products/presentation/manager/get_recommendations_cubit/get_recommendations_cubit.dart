
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/recommendation_entity.dart';
import '../../../data/repos/product_repo.dart';

part 'get_recommendations_state.dart';

class GetRecommendationsCubit extends Cubit<GetRecommendationsState> {
  final ProductsRepo productRepo;

  GetRecommendationsCubit(this.productRepo) : super(GetRecommendationsInitial());

  Future<void> getRecommendations({
    required String productId,
    required String imageId,
  }) async {
    emit(GetRecommendationsLoading());
    final result = await productRepo.getRecommendations(
      productId: productId,
      imageId: imageId,
    );
    result.fold(
          (failure) => emit(GetRecommendationsFailure(errorMessage: failure.errorMessage)),
          (recommendations) => emit(GetRecommendationsSuccess(recommendations: recommendations)),
    );
  }
}