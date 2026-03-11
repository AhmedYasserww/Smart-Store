import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entities/verification_entity.dart';
import '../../../data/repos/auth_repo.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final AuthRepo authRepo;

  VerifyOtpCubit(this.authRepo) : super(VerifyOtpInitial());
  Future<void> verifyOtp({
    required String userId,
    required String otp,
  }) async {
    emit(VerifyOtpLoading());

    try {
      final result = await authRepo.verifyOtp(
        verificationEntity: VerificationEntity(
          userId: userId,
          otp: otp,
        ),
      );

      result.fold(
            (failure) => emit(VerifyOtpFailure(errorMessage: failure.errorMessage)),
            (model) => emit(VerifyOtpSuccess(
          message: model.message,
          isVerified: model.data ?? false,
        )),
      );
    } catch (e) {
      emit(VerifyOtpFailure(errorMessage: "Unexpected error: $e"));
    }
  }
}