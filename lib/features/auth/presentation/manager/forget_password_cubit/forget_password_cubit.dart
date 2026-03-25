import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/entities/forget_password_entity.dart';
import '../../../data/models/forget_password_model.dart';
import '../../../data/repos/auth_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final AuthRepo authRepo;

  ForgetPasswordCubit(this.authRepo)
      : super(ForgetPasswordInitial());

  Future<void> forgetPassword({
    required String email,
  }) async {
    emit(ForgetPasswordLoading());

    try {
      final result = await authRepo.forgetPassword(
        forgetPasswordEntity: ForgetPasswordEntity(
          email: email,
        ),
      );

      result.fold(
            (failure) => emit(
          ForgetPasswordFailure(
            errorMessage: failure.errorMessage,
          ),
        ),
            (model) => emit(
          ForgetPasswordSuccess(
            forgetPasswordModel: model,
          ),
        ),
      );
    } catch (e) {
      emit(
        ForgetPasswordFailure(errorMessage: "Unexpected error: $e",),
      );
    }
  }
}