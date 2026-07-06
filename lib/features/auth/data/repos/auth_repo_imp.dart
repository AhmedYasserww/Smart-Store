import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/helper_functions/save_user_data.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/end_points.dart';
import '../entities/forget_password_entity.dart';
import '../entities/google_login_entity.dart';
import '../entities/log_in_entity.dart';
import '../entities/register_entity.dart';
import '../entities/resend_otp_entity.dart';
import '../entities/reset_password_entity.dart';
import '../entities/verification_entity.dart';
import '../models/forget_password_model.dart';
import '../models/google_login_model.dart';
import '../models/log_in_model.dart';
import '../models/register_model.dart';
import '../models/resend_otp_model.dart';
import '../models/reset_password_model.dart';
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
        endPoint: EndPoints.registerClient,
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

  ///////////////////////////////////////////////////

  @override
  Future<Either<Failure, VerificationModel>> confirmEmail({
    required VerificationEntity verificationEntity,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.confirmEmail,
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
          return Left(
            ServerFailure(
              errorMessage: response["message"] ?? "Verification failed",
            ),
          );
        }
      } else {
        return Left(ServerFailure(errorMessage: "Invalid response"));
      }
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          errorMessage: e.response?.data?["message"] ?? "Request failed",
        ),
      );
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
    }
  }
  ////////////////////////////////////////////

  @override
  Future<Either<Failure, VerificationModel>> confirmResetPassword({
    required VerificationEntity verificationEntity,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.confirmResetPassword,
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
          return Left(
            ServerFailure(
              errorMessage: response["message"] ?? "Verification failed",
            ),
          );
        }
      } else {
        return Left(ServerFailure(errorMessage: "Invalid response"));
      }
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          errorMessage: e.response?.data?["message"] ?? "Request failed",
        ),
      );
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
    }
  }

  ///////////////////////////////////////////////////////////

  @override
  Future<Either<Failure, ResetPasswordModel>> resetPassword({
    required ResetPasswordEntity entity,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.resetPassword,
        data: {
          "userId": entity.userId,
          "token": entity.token,
          "newPassword": entity.newPassword,
          "confirmPassword": entity.confirmPassword,
        },
      );

      if (response is Map<String, dynamic>) {
        final int? statusCode = response["statusCode"];
        final bool succeeded = response["succeeded"] ?? false;

        if (statusCode == 200 && succeeded) {
          return Right(ResetPasswordModel.fromJson(response));
        } else {
          return Left(
            ServerFailure(
              errorMessage: response["message"] ?? "Reset password failed",
            ),
          );
        }
      } else {
        return Left(ServerFailure(errorMessage: "Invalid response"));
      }
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          errorMessage: e.response?.data?["message"] ?? "Request failed",
        ),
      );
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
    }
  }

  ///////////////////////////////////////////////////////////

  @override
  Future<Either<Failure, LoginModel>> login({
    required LoginEntity loginEntity,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.login,
        data: {"email": loginEntity.email, "password": loginEntity.password},
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

  ///////////////////////////////////////////////////////////

  @override
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword({
    required ForgetPasswordEntity forgetPasswordEntity,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.forgetPassword,
        data: {"email": forgetPasswordEntity.email},
      );

      if (response is Map<String, dynamic>) {
        final int? statusCode = response["statusCode"];
        final bool succeeded = response["succeeded"] ?? false;

        if (statusCode == 200 && succeeded) {
          return Right(ForgetPasswordModel.fromJson(response));
        } else {
          final errorMessage = response["message"] ?? "Forget password failed";
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
      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
    }
  }

  //////////////////////////////////////////////////

  @override
  Future<Either<Failure, ResendOtpModel>> resendOtp({
    required ResendOtpEntity entity,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.resendOtp,
        data: {"userId": entity.userId},
      );

      if (response is Map<String, dynamic>) {
        final statusCode = response["statusCode"];
        final succeeded = response["succeeded"] ?? false;

        if (statusCode == 200 && succeeded) {
          return Right(ResendOtpModel.fromJson(response));
        } else {
          return Left(
            ServerFailure(
              errorMessage: response["message"] ?? "Resend OTP failed",
            ),
          );
        }
      } else {
        return Left(ServerFailure(errorMessage: "Invalid response"));
      }
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          errorMessage:
              e.response?.data?["message"] ?? "Resend OTP request failed",
        ),
      );
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
    }
  }

  @override
  Future<Either<Failure, String>> logout() async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.logout,
        data: {},
      );

      log("🔐 Logout Response: $response");

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 && response['succeeded'] == true) {
          return right(message ?? "Logged out successfully");
        } else {
          return left(ServerFailure(errorMessage: message ?? "Logout failed"));
        }
      } else {
        return left(ServerFailure(errorMessage: "Unexpected response format"));
      }
    } on DioException catch (e) {
      log('❌ DioException (Logout): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (Logout): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }


  //////////////////////////////////////////////////////////////////

  @override
  Future<Either<Failure, GoogleLoginEntity>> loginWithGoogle({
    required String idToken,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.googleLogin,
        data: {'idToken': idToken},
      );

      log("🔐 Google Login Response: $response");

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 && response['succeeded'] == true) {
          // ✅ الـ data متداخل جوا data
          final innerData = response['data']['data'];

          final entity = GoogleLoginModel.fromJson(innerData);

          await UserPreferences.saveLoginData(
            id: entity.userId,
            email: entity.email,
            phoneNumber: '',
            accessToken: entity.accessToken,
            refreshToken: entity.refreshToken,
            role: entity.roles,
            isEmailConfirmed: true,
          );

          return right(entity);
        } else {
          return left(ServerFailure(
            errorMessage: message ?? "Google login failed",
          ));
        }
      }
      return left(ServerFailure(errorMessage: "Unexpected response format"));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
