import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/reset_password_entity.dart';
import '../../../data/repos/auth_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepo authRepo;

  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial());

  Future<void> resetPassword({required ResetPasswordEntity entity}) async {
    emit(ResetPasswordLoading());

    try {
      final result = await authRepo.resetPassword(entity: entity);

      result.fold(
            (failure) => emit(
          ResetPasswordFailure(errorMessage: failure.errorMessage),
        ),
            (model) {
          if (model.data != null) {
            emit(
              ResetPasswordSuccess(
                message: model.message,
                userId: model.data!.userId,
                email: model.data!.email,
              ),
            );
          } else {
            emit(
              ResetPasswordFailure(errorMessage: "No data returned from server"),
            );
          }
        },
      );
    } catch (e) {
      emit(
        ResetPasswordFailure(errorMessage: "Unexpected error: $e"),
      );
    }
  }
}