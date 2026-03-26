import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/resend_otp_entity.dart';
import '../../../data/repos/auth_repo.dart';

part 'resend_otp_state.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  final AuthRepo authRepo;

  ResendOtpCubit(this.authRepo) : super(ResendOtpInitial());

  Future<void> resendOtp({required String userId}) async {
    emit(ResendOtpLoading());

    try {
      final result = await authRepo.resendOtp(
        entity: ResendOtpEntity(userId: userId),
      );

      result.fold(
            (failure) =>
            emit(ResendOtpFailure(errorMessage: failure.errorMessage)),
            (model) =>
            emit(ResendOtpSuccess(message: model.message)),
      );
    } catch (e) {
      emit(
        ResendOtpFailure(errorMessage: "Unexpected error: $e"),
      );
    }
  }
}