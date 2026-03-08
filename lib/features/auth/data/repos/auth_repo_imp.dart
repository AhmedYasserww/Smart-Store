import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../entities/register_entity.dart';
import '../models/register_model.dart';
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
        "password": registerEntity.password,
        "ConfirmPassword": registerEntity.confirmPassword,
        "PhoneNumber": registerEntity.phoneNumber,
        "Address": registerEntity.address,
        if (registerEntity.age != null) "age": registerEntity.age,
      });

      final response = await apiService.postMultipart(
        endPoint: "Account/register/client",
        data: formData,
      );

      if (response["succeeded"] == true) {
        return Right(RegisterModel.fromJson(response));
      } else {
        final errorMessage = response["message"] ?? "Register failed";
        return Left(ServerFailure(errorMessage: errorMessage));
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data["message"] ?? "Register failed";
      return Left(ServerFailure(errorMessage: errorMessage));
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
    }
  }
}