import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/constants/verify_otp_enum.dart';
import '../../../data/entities/verification_entity.dart';
import '../../../data/repos/auth_repo.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final AuthRepo authRepo;

  VerifyOtpCubit(this.authRepo) : super(VerifyOtpInitial());

  Future<void> verifyOtp({
    required String userId,
    required String otp,
    required OtpType type,
  }) async {
    emit(VerifyOtpLoading());

    try {
      final result = type == OtpType.register
          ? await authRepo.confirmEmail(
        verificationEntity: VerificationEntity(
          userId: userId,
          otp: otp,
        ),
      )
          : await authRepo.confirmResetPassword(
        verificationEntity: VerificationEntity(
          userId: userId,
          otp: otp,
        ),
      );

      result.fold(
            (failure) => emit(VerifyOtpFailure(errorMessage: failure.errorMessage)),
            (model) {
              if (type == OtpType.register) {
                emit(VerifyOtpSuccess(
                  message: model.message,
                  isVerified: model.data ?? false,
                ));
              } else {
                if (model.token != null) {
                  emit(VerifyOtpForgetSuccess(
                    message: model.message,
                    token: model.token!,
                  ));
                } else {
                  emit(VerifyOtpFailure(
                    errorMessage: "Token not found in response",
                  ));
                }
              }
        },
      );
    } catch (e) {
      emit(VerifyOtpFailure(errorMessage: "Unexpected error: $e"));
    }
  }
}