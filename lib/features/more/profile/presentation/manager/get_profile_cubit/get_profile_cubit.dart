import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/cart_profile_entity.dart';
import '../../../data/repos/profile_repo.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  final ProfileRepo profileRepo;

  GetProfileCubit(this.profileRepo) : super(GetProfileInitial());

  Future<void> getProfile() async {
    print("========== GET PROFILE CALLED ==========");
    emit(GetProfileLoading());
    final result = await profileRepo.getProfile();
    result.fold(
          (failure) => emit(GetProfileFailure(errorMessage: failure.errorMessage)),
          (profile) => emit(GetProfileSuccess(profile: profile)),
    );
  }
}