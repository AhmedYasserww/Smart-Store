// features/profile/data/repos/profile_repo_impl.dart

import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/api_service.dart';
import '../../../../../core/services/end_points.dart';
import '../entities/cart_profile_entity.dart';
import '../models/client_profile_model.dart';
import 'profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService apiService;

  ProfileRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, ClientProfileEntity>> getProfile() async {
    try {
      final response = await apiService.get(
        endPoint: EndPoints.getProfile,
      );

      log('👤 GetProfile Response: $response');

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 && response['succeeded'] == true) {
          return right(ClientProfileModel.fromJson(response['data']));
        } else {
          return left(ServerFailure(
            errorMessage: message ?? 'Failed to get profile',
          ));
        }
      }
      return left(ServerFailure(errorMessage: 'Unexpected API response format'));
    } on DioException catch (e) {
      log('❌ DioException (GetProfile): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (GetProfile): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
  @override
  Future<Either<Failure, String>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.changePassword,
        data: {
          'currentPassword': currentPassword,
          'newPassword': newPassword,
          'confirmNewPassword': confirmNewPassword,
        },
      );

      log(' ChangePassword Response: $response');

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 && response['succeeded'] == true) {
          return right(message ?? 'Password changed successfully.');
        } else {
          return left(ServerFailure(errorMessage: message ?? 'Failed to change password'));
        }
      }
      return left(ServerFailure(errorMessage: 'Unexpected API response format'));
    } on DioException catch (e) {
      log('❌ DioException (ChangePassword): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (ChangePassword): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
  @override
  
  Future<Either<Failure, String>> updateProfile({
    String? fullName,
    String? email,
    String? phoneNumber,
    File? profileImage,
  }) async {
    try {
      final map = <String, dynamic>{};

      if (fullName != null && fullName.isNotEmpty) map['FullName'] = fullName;
      if (email != null && email.isNotEmpty) map['Email'] = email;
      if (phoneNumber != null && phoneNumber.isNotEmpty) map['PhoneNumber'] = phoneNumber;
      if (profileImage != null) {
        map['ProfileImage'] = await MultipartFile.fromFile(
          profileImage.path,
          filename: 'profile_image.jpg',
        );
      }

      final formData = FormData.fromMap(map);

      final response = await apiService.putMultipart(
        endPoint: EndPoints.updateProfile,
        data: formData,
      );

      log("👤 UpdateProfile Response: $response");

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 && response['succeeded'] == true) {
          return right(message ?? "Profile updated successfully");
        } else {
          return left(ServerFailure(
            errorMessage: message ?? "Failed to update profile",
          ));
        }
      }
      return left(ServerFailure(errorMessage: "Unexpected response format"));
    } on DioException catch (e) {
      log('❌ DioException (UpdateProfile): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (UpdateProfile): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}