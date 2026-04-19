// features/profile/data/repos/profile_repo.dart

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/cart_profile_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ClientProfileEntity>> getProfile();
}