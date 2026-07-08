import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/end_points.dart';
import '../entities/vto_entity.dart';
import 'vto_repo.dart';

class VtoRepoImpl implements VtoRepo {
  final ApiService apiService;
  VtoRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, VtoEntity>> tryOn({
    required File personImage,
    required String garmentUrl,
    required String category,
  }) async {
    try {
      final formData = FormData.fromMap({
        'personImage': await MultipartFile.fromFile(
          personImage.path,
          filename: 'person_image.jpg',
        ),
        'garmentUrl': garmentUrl,
        'category': category,
        'garmentPhotoType': 'model',
      });


      final dio = Dio();
      final token = await apiService.resolveToken(null);
      final response = await dio.post(
        '${apiService.baseUrl}${EndPoints.tryOn}',
        data: formData,
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Accept': '*/*',
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );

      log("👗 VTO Response status: ${response.statusCode}");
      log("👗 VTO Response data type: ${response.data.runtimeType}");

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;

        // ✅ لو List<int> أو Uint8List — image bytes
        if (data is List<int> || data is Uint8List) {
          final bytes = data is Uint8List
              ? data
              : Uint8List.fromList(data as List<int>);

          log("👗 VTO bytes length: ${bytes.length}");
          log("👗 VTO first bytes: ${bytes.take(4).toList()}");

          return right(VtoEntity(resultImageBytes: bytes));
        }

        return left(ServerFailure(errorMessage: 'Unexpected response format'));
      } else {
        return left(ServerFailure(errorMessage: 'Failed to generate try-on'));
      }
    } on DioException catch (e) {
      log('❌ DioException (VTO): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (VTO): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}