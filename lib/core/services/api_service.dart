import 'package:dio/dio.dart';
import '../constants/api_constants.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio}) {
    dio.options.baseUrl = ApiConstants.baseUrl;
    dio.options.headers = {
      "Accept": "application/json",
    };

    dio.options.connectTimeout = const Duration(seconds: 15);
    dio.options.receiveTimeout = const Duration(seconds: 15);
  }

  ///  Build Options
  Options _buildOptions({String? token, String? contentType}) {
    return Options(
      headers: {
        if (contentType != null) "Content-Type": contentType,
        if (token != null) "Authorization": "Bearer $token",
      },
    );
  }

  ///  Handle Dio Errors
  dynamic _handleDioError(DioException e) {
    if (e.response != null) {
      return e.response?.data;
    } else {
      throw Exception("Network error: ${e.message}");
    }
  }

  /// GET REQUEST
  Future<dynamic> get({
    required String endPoint,
    String? token,
  }) async {
    try {
      final response = await dio.get(
        endPoint,
        options: _buildOptions(token: token),
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
        endPoint,
        data: data,
        options: _buildOptions(
          token: token,
          contentType: ApiConstants.contentType,
        ),
      );

      return response.data;
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  /// POST MULTIPART
  Future<dynamic> postMultipart({
    required String endPoint,
    required FormData data,
    String? token,
  }) async {
    try {
      final response = await dio.post(
        endPoint,
        data: data,
        options: _buildOptions(
          token: token,
          contentType: "multipart/form-data",
        ),
      );

      return response.data;
    } on DioException catch (e) {
      return _handleDioError(e);
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
        endPoint,
        data: data,
        options: _buildOptions(
          token: token,
          contentType: ApiConstants.contentType,
        ),
      );

      return response.data;
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }
}