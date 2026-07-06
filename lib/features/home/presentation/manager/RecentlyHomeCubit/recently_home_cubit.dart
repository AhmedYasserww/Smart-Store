import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/home/data/models/product_home_model.dart';
import 'package:smart_store/features/home/data/repos/home_repo.dart';

part 'recently_home_state.dart';

class RecentlyHomeCubit extends Cubit<RecentlyHomeState> {
  RecentlyHomeCubit({required this.homeRepo}) : super(RecentlyHomeInitial());
  final HomeRepo homeRepo;

  Future<void> getRecentlyViewdProduct() async {
    emit(RecentlyHomeLoading());

    final returnedData = await homeRepo.getRecentlyProducts();
    returnedData.fold(
      (error) {
        print(error.errorMessage);
        emit(RecentlyHomeFailure(errMessage: error.errorMessage));
      },
      (data) {
        emit(RecentlyHomeSuccess(products: data));
      },
    );
  }
}
