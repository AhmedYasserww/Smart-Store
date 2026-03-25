import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../entities/forget_password_entity.dart';
import '../entities/log_in_entity.dart';
import '../entities/register_entity.dart';
import '../entities/verification_entity.dart';
import '../models/forget_password_model.dart';
import '../models/log_in_model.dart';
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
  @override
  Future<Either<Failure, VerificationModel>> confirmEmail({
    required VerificationEntity verificationEntity,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: "Account/confirm-email",
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
          return Left(ServerFailure(
            errorMessage: response["message"] ?? "Verification failed",
          ));
        }
      } else {
        return Left(ServerFailure(errorMessage: "Invalid response"));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.response?.data?["message"] ?? "Request failed",
      ));
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
    }
  }
  @override
  @override
  Future<Either<Failure, VerificationModel>> confirmResetPassword({
    required VerificationEntity verificationEntity,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: "Account/confirm-reset-password",
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
          return Left(ServerFailure(
            errorMessage: response["message"] ?? "Verification failed",
          ));
        }
      } else {
        return Left(ServerFailure(errorMessage: "Invalid response"));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.response?.data?["message"] ?? "Request failed",
      ));
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
    }
  }
  @override
  Future<Either<Failure, LoginModel>> login({
    required LoginEntity loginEntity,
  }) async {
    try {

      final response = await apiService.post(
        endPoint: "Account/login",
        data: {
          "email": loginEntity.email,
          "password": loginEntity.password,
        },
      );

      if (response is Map<String, dynamic>) {

        final int? statusCode = response["statusCode"];
        final bool succeeded = response["succeeded"] ?? false;

        if (statusCode == 200 && succeeded) {
          return Right(LoginModel.fromJson(response));
        } else {
          final errorMessage = response["message"] ?? "Login failed";
          return Left(ServerFailure(errorMessage: errorMessage));
        }

      } else {
        return Left(ServerFailure(errorMessage: "Invalid server response"));
      }

    } on DioException catch (e) {

      final errorMessage =
          e.response?.data?["message"] ?? "Login request failed";

      return Left(ServerFailure(errorMessage: errorMessage));

    } catch (e) {

      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));

    }
  }
  @override
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword({
    required ForgetPasswordEntity forgetPasswordEntity,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: "Account/forget-password",
        data: {
          "email": forgetPasswordEntity.email,
        },
      );

      if (response is Map<String, dynamic>) {
        final int? statusCode = response["statusCode"];
        final bool succeeded = response["succeeded"] ?? false;

        if (statusCode == 200 && succeeded) {
          return Right(ForgetPasswordModel.fromJson(response));
        } else {
          final errorMessage =
              response["message"] ?? "Forget password failed";
          return Left(ServerFailure(errorMessage: errorMessage));
        }
      } else {
        return Left(ServerFailure(errorMessage: "Invalid server response"));
      }
    } on DioException catch (e) {
      final errorMessage =
          e.response?.data?["message"] ?? "Forget password request failed";

      return Left(ServerFailure(errorMessage: errorMessage));
    } catch (e) {
      return Left(
        ServerFailure(errorMessage: "Unexpected error: $e"),
      );
    }
  }
}