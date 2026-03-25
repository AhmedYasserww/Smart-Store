import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/forget_password_entity.dart';
import '../entities/log_in_entity.dart';
import '../entities/register_entity.dart';
import '../entities/reset_password_entity.dart';
import '../entities/verification_entity.dart';
import '../models/forget_password_model.dart';
import '../models/log_in_model.dart';
import '../models/register_model.dart';
import '../models/reset_password_model.dart';
import '../models/verification_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, RegisterModel>> registerClient({
    required RegisterEntity registerEntity,
  });
  Future<Either<Failure, VerificationModel>> confirmEmail({
    required VerificationEntity verificationEntity,
  });
  Future<Either<Failure, LoginModel>> login({
    required LoginEntity loginEntity,
  });
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword({
    required ForgetPasswordEntity forgetPasswordEntity,
  });
  Future<Either<Failure, VerificationModel>> confirmResetPassword({
    required VerificationEntity verificationEntity,
  });
  Future<Either<Failure, ResetPasswordModel>> resetPassword({
    required ResetPasswordEntity entity,
  });
}