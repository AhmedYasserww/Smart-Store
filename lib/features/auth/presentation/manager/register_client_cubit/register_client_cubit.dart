import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/entities/register_entity.dart';
import '../../../data/models/register_model.dart';
import '../../../data/repos/auth_repo.dart';
part 'register_client_state.dart';

class RegisterClientCubit extends Cubit<RegisterClientState> {
  RegisterClientCubit(this.authRepo) : super(RegisterClientInitial());

  final AuthRepo authRepo;

  Future<void> registerClient(RegisterEntity registerEntity) async {
    emit(RegisterClientLoading());

    final result = await authRepo.registerClient(
      registerEntity: registerEntity,
    );

    result.fold((failure) {
      emit(RegisterClientFailure(errorMessage: failure.errorMessage,));
      },
          (registerModel) {
        emit(RegisterClientSuccess(registerModel: registerModel,));
      },
    );
  }
}