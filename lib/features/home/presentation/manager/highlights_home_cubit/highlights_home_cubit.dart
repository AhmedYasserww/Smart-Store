import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/home/data/models/product_home_model.dart';
import 'package:smart_store/features/home/data/repos/home_repo.dart';

part 'highlights_home_state.dart';

class HighlightsHomeCubit extends Cubit<HighlightsHomeState> {
  HighlightsHomeCubit({required this.homeRepo})
      : super(HighlightsHomeInitial());

  final HomeRepo homeRepo;

  Future<void> getHighlightsProducts() async {
    emit(HighlightsHomeLoading());

    final returnedData = await homeRepo.getHighlightsProducts();

    returnedData.fold(
      (error) {
        emit(HighlightsHomeFailure(errMessage: error.errorMessage));
      },
      (data) {
        emit(HighlightsHomeSuccess(products: data));
      },
    );
  }
}