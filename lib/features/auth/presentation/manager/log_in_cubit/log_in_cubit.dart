import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/log_in_entity.dart';
import '../../../data/models/log_in_model.dart';
import '../../../data/repos/auth_repo.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this.authRepo) : super(LogInInitial());

  final AuthRepo authRepo;

  Future<void> logIn(LoginEntity loginEntity) async {
    emit(LogInLoading());

    final result = await authRepo.login(
      loginEntity: loginEntity,
    );

    result.fold(
          (failure) {
        emit(LogInFailure(errorMessage: failure.errorMessage));
      },
          (loginModel) {
        emit(LogInSuccess(loginModel: loginModel));
      },
    );
  }
}