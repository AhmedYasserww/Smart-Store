import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/register_entity.dart';
import '../entities/verification_entity.dart';
import '../models/register_model.dart';
import '../models/verification_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, RegisterModel>> registerClient({
    required RegisterEntity registerEntity,
  });
  Future<Either<Failure, VerificationModel>> verifyOtp({
    required VerificationEntity verificationEntity,
  });
}