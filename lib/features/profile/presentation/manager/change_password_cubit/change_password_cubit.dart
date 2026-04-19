import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/repos/profile_repo.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ProfileRepo profileRepo;

  ChangePasswordCubit(this.profileRepo) : super(ChangePasswordInitial());

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    emit(ChangePasswordLoading());

    final result = await profileRepo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmNewPassword: confirmNewPassword,
    );

    result.fold(
          (failure) => emit(ChangePasswordFailure(errorMessage: failure.errorMessage)),
          (message) => emit(ChangePasswordSuccess(message: message)),
    );
  }
}