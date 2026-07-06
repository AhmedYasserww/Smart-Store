import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/home/data/models/product_home_model.dart';
import 'package:smart_store/features/home/data/repos/home_repo.dart';

part 'top_selling_home_state.dart';

class TopSellingHomeCubit extends Cubit<TopSellingHomeState> {
  TopSellingHomeCubit({required this.homeRepo})
    : super(TopSellingHomeInitial());
  final HomeRepo homeRepo;

  Future<void> getTopSellingProducts() async {
    emit(TopSellingHomeLoading());

    final returnedData = await homeRepo.getTopSellingProducts();
    returnedData.fold(
      (error) {
        print(error.errorMessage);
        emit(TopSellingHomeFailure(errMessage: error.errorMessage));
      },
      (data) {
        emit(TopSellingHomeSuccess(products: data));
      },
    );
  }
}
