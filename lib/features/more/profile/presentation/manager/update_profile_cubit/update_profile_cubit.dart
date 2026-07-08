// update_profile_cubit.dart
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/repos/profile_repo.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final ProfileRepo profileRepo;
  UpdateProfileCubit(this.profileRepo) : super(UpdateProfileInitial());

  Future<void> updateProfile({
    required String fullName,
    required String email,
    required String phoneNumber,
    File? profileImage,
  }) async {
    emit(UpdateProfileLoading());
    final result = await profileRepo.updateProfile(
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      profileImage: profileImage,
    );
    result.fold(
          (failure) => emit(UpdateProfileFailure(errorMessage: failure.errorMessage)),
          (message) => emit(UpdateProfileSuccess(message: message)),
    );
  }
}