import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../entities/register_entity.dart';
import '../entities/verification_entity.dart';
import '../models/register_model.dart';
import '../models/verification_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, RegisterModel>> registerClient({
    required RegisterEntity registerEntity,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "FullName": registerEntity.fullName,
        "Email": registerEntity.email,
        "Password": registerEntity.password,
        "ConfirmPassword": registerEntity.confirmPassword,
        "PhoneNumber": registerEntity.phoneNumber,
        "Address": registerEntity.address,
        if (registerEntity.age != null) "Age": registerEntity.age,
      });

      final response = await apiService.postMultipart(
        endPoint: "Account/register/client",
        data: formData,
      );

      /// check response safety
      if (response is Map<String, dynamic>) {
        final int? statusCode = response["statusCode"];
        final bool succeeded = response["succeeded"] ?? false;

        if ((statusCode == 200 || statusCode == 201) && succeeded) {
          return Right(RegisterModel.fromJson(response));
        } else {
          final errorMessage = response["message"] ?? "Register failed";
          return Left(ServerFailure(errorMessage: errorMessage));
        }
      } else {
        return Left(ServerFailure(errorMessage: "Invalid server response"));
      }

    } on DioException catch (e) {

      final errorMessage =
          e.response?.data?["message"] ?? "Register request failed";

      return Left(ServerFailure(errorMessage: errorMessage));

    } catch (e) {
      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
    }
  }
  @override
  Future<Either<Failure, VerificationModel>> verifyOtp({
    required VerificationEntity verificationEntity,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: "Account/verify-otp",
        data: {
          "userId": verificationEntity.userId,
          "otp": verificationEntity.otp,
        },
      );

      if (response is Map<String, dynamic>) {
        final int? statusCode = response["statusCode"];
        final bool succeeded = response["succeeded"] ?? false;

        if (statusCode == 200 && succeeded) {
          return Right(VerificationModel.fromJson(response));
        } else {
          final errorMessage = response["message"] ?? "Verification failed";
          return Left(ServerFailure(errorMessage: errorMessage));
        }
      } else {
        return Left(ServerFailure(errorMessage: "Invalid server response"));
      }
    } on DioException catch (e) {
      final errorMessage =
          e.response?.data?["message"] ?? "Verification request failed";
      return Left(ServerFailure(errorMessage: errorMessage));
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
    }
  }
}