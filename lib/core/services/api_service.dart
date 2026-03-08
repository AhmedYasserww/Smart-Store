import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  final String baseUrl = "https://tryha.runasp.net/api/";

  /// GET REQUEST
  Future<dynamic> get({
    required String endPoint,
    String? token,
  }) async {
    try {
      final response = await dio.get(
        "$baseUrl$endPoint",
        options: Options(
          headers: {
            "Accept": "application/json",
            if (token != null) "Authorization": "Bearer $token",
          },
        ),
      );

      return response.data;
    } on DioException catch (e) {
      throw Exception(
        "GET Error: ${e.response?.statusCode} - ${e.response?.data}",
      );
    }
  }

  /// POST JSON REQUEST
  Future<dynamic> post({
    required String endPoint,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    try {
      final response = await dio.post(
        "$baseUrl$endPoint",
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            if (token != null) "Authorization": "Bearer $token",
          },
        ),
      );

      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response?.data;
      } else {
        throw Exception("Network error: ${e.message}");
      }
    }
  }

  /// POST MULTIPART (FormData)
  Future<dynamic> postMultipart({
    required String endPoint,
    required FormData data,
    String? token,
  }) async {
    try {
      final response = await dio.post(
        "$baseUrl$endPoint",
        data: data,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
            if (token != null) "Authorization": "Bearer $token",
          },
        ),
      );

      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response?.data;
      } else {
        throw Exception("Network error: ${e.message}");
      }
    }
  }

  /// DELETE REQUEST
  Future<dynamic> delete({
    required String endPoint,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      final response = await dio.delete(
        "$baseUrl$endPoint",
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            if (token != null) "Authorization": "Bearer $token",
          },
        ),
      );

      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response?.data;
      } else {
        throw Exception("Network error: ${e.message}");
      }
    }
  }
}