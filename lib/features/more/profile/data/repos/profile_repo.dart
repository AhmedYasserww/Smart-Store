// features/profile/data/repos/profile_repo.dart

import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/cart_profile_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ClientProfileEntity>> getProfile();
  Future<Either<Failure, String>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  });
  Future<Either<Failure, String>> updateProfile({
    required String fullName,
    required String email,
    required String phoneNumber,
    File? profileImage,
  });
}