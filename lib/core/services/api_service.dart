import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/api_constants.dart';
import '../helper_functions/save_user_data.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio}) {
    dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {
        "Accept": "application/json",
      },

      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 15),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );
  }

  /// BUILD OPTIONS
  Options _buildOptions({
    String? token,
    String? contentType,
  }) {
    return Options(
      headers: {
        if (contentType != null)
          "Content-Type": contentType,

        if (token != null && token.isNotEmpty)
          "Authorization": "Bearer $token",
      },
    );
  }
  String get baseUrl => dio.options.baseUrl;

  Future<String?> resolveToken(String? token) => _resolveToken(token);
  /// RESOLVE TOKEN
  Future<String?> _resolveToken(String? token) async {
    if (token != null && token.isNotEmpty) {
      return token;
    }


    final userData = await UserPreferences.getUserData();

    final accessToken =
        (userData['accessToken'] as String?) ?? '';

    if (accessToken.isNotEmpty) {
      return accessToken;
    }

    final fallbackToken =
    await UserPreferences.getToken();

    if (fallbackToken.isNotEmpty) {
      return fallbackToken;
    }

    return null;
  }

  /// HANDLE DIO ERRORS
  String _handleDioError(DioException e) {
    switch (e.type) {

      case DioExceptionType.connectionTimeout:
        return "Connection timeout. Please try again.";

      case DioExceptionType.receiveTimeout:
        return "Server is taking too long to respond.";

      case DioExceptionType.sendTimeout:
        return "Failed to send request.";

      case DioExceptionType.connectionError:
        return "No internet connection.";

      case DioExceptionType.badResponse:
        final data = e.response?.data;

        if (data is Map<String, dynamic>) {
          return data["message"]?.toString() ?? "Server error occurred.";
        }

        if (data is String) {
          return data;
        }

        return "Server error occurred.";

      case DioExceptionType.cancel:
        return "Request was cancelled.";

      default:
        return "Unexpected error occurred.";
    }
  }

  /// GET REQUEST
  Future<dynamic> get({
    required String endPoint,
    String? token,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      final resolvedToken =
      await _resolveToken(token);

      final response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: _buildOptions(
          token: resolvedToken,
        ),
      );

      return response.data;

    }
   on DioException {
  rethrow;
}
    // on DioException catch (e) {
    //   throw Exception(_handleDioError(e));
    // }
  }

  /// POST REQUEST
  Future<dynamic> post({
    required String endPoint,
    required Map<String, dynamic> data,
    String? token,
  }) async {

    final resolvedToken =
    await _resolveToken(token);

    try {

      final response = await dio.post(
        endPoint,
        data: data,
        options: _buildOptions(
          token: resolvedToken,
          contentType: ApiConstants.contentType,
        ),
      );

      return response.data;

    } on DioException catch (e) {

      /// RETRY ON TIMEOUT
      if (e.type ==
          DioExceptionType.connectionTimeout) {

        try {

          final retryResponse = await dio.post(
            endPoint,
            data: data,
            options: _buildOptions(
              token: resolvedToken,
              contentType:
              ApiConstants.contentType,
            ),
          );

          return retryResponse.data;

        } on DioException catch (retryError) {
          throw Exception(
            _handleDioError(retryError),
          );
        }
      }

      throw Exception(_handleDioError(e));
    }
  }

  /// POST MULTIPART
  Future<dynamic> postMultipart({
    required String endPoint,
    required FormData data,
    String? token,
  }) async {
    try {

      final resolvedToken =
      await _resolveToken(token);

      final response = await dio.post(
        endPoint,
        data: data,
        options: _buildOptions(
          token: resolvedToken,
          contentType: "multipart/form-data",
        ),
      );

      return response.data;

    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  /// PUT REQUEST
  Future<dynamic> put({
    required String endPoint,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    try {

      final resolvedToken =
      await _resolveToken(token);

      final response = await dio.put(
        endPoint,
        data: data,
        options: _buildOptions(
          token: resolvedToken,
          contentType: ApiConstants.contentType,
        ),
      );

      return response.data;

    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }
  /// PUT MULTIPART
  Future<dynamic> putMultipart({
    required String endPoint,
    required FormData data,
    String? token,
  }) async {
    try {
      final resolvedToken = await _resolveToken(token);
      final response = await dio.put(
        endPoint,
        data: data,
        options: _buildOptions(
          token: resolvedToken,
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

      final resolvedToken =
      await _resolveToken(token);

      final response = await dio.delete(
        endPoint,
        data: data,
        options: _buildOptions(
          token: resolvedToken,
          contentType: ApiConstants.contentType,
        ),
      );

      return response.data;

    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }
}


// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:smart_store/core/helper_functions/save_user_data.dart';
//
// import '../constants/api_constants.dart';
//
// class ApiService {
//   final Dio dio;
//
//   ApiService({required this.dio}) {
//     dio.options.baseUrl = ApiConstants.baseUrl;
//     dio.options.headers = {"Accept": "application/json"};
//
//
//     dio.options.connectTimeout = const Duration(seconds: 30);
//     dio.options.receiveTimeout = const Duration(seconds: 30);
//     dio.interceptors.add(
//       PrettyDioLogger(
//         requestHeader: true,
//         requestBody: true,
//         responseBody: true,
//         responseHeader: false,
//         error: true,
//         compact: true,
//         maxWidth: 90,
//         enabled: kDebugMode,
//       ),
//     );
//   }
//
//   ///  Build Options
//   Options _buildOptions({String? token, String? contentType}) {
//     return Options(
//       headers: {
//         if (contentType != null) "Content-Type": contentType,
//         if (token != null) "Authorization": "Bearer $token",
//       },
//     );
//   }
//
//   Future<String?> _resolveToken(String? token) async {
//     if (token != null && token.isNotEmpty) {
//       return token;
//     }
//
//     final userData = await UserPreferences.getUserData();
//     final accessToken = (userData['accessToken'] as String?) ?? '';
//     if (accessToken.isNotEmpty) {
//       return accessToken;
//     }
//
//     final fallbackToken = await UserPreferences.getToken();
//     if (fallbackToken.isNotEmpty) {
//       return fallbackToken;
//     }
//
//     return null;
//   }
//
//   ///  Handle Dio Errors
//   dynamic _handleDioError(DioException e) {
//     if (e.response != null) {
//       return e.response?.data;
//     } else {
//       throw Exception("Network error: ${e.message}");
//     }
//   }
//   /// GET REQUEST
//   ///
//   Future<dynamic> get({
//     required String endPoint,
//     String? token,
//     Map<String, dynamic>? queryParameters,
//     CancelToken? cancelToken,
//   }) async {
//     try {
//       final resolvedToken = await _resolveToken(token);
//       final response = await dio.get(
//         endPoint,
//         queryParameters: queryParameters,
//         cancelToken: cancelToken,
//         options: _buildOptions(token: resolvedToken),
//       );
//
//       return response.data;
//     } on DioException catch (e) {
//       throw Exception(
//         "GET Error: ${e.response?.statusCode} - ${e.response?.data}",
//       );
//     }
//   }
//
//
//
//   /// POST JSON REQUEST
//   Future<dynamic> post({
//     required String endPoint,
//     required Map<String, dynamic> data,
//     String? token,
//   }) async {
//     try {
//       final resolvedToken = await _resolveToken(token);
//       final response = await dio.post(
//         endPoint,
//         data: data,
//         options: _buildOptions(
//           token: resolvedToken,
//           contentType: ApiConstants.contentType,
//         ),
//       );
//
//       return response.data;
//     } on DioException catch (e) {
//       return _handleDioError(e);
//     }
//   }
//
//   /// POST MULTIPART
//   Future<dynamic> postMultipart({
//     required String endPoint,
//     required FormData data,
//     String? token,
//   }) async {
//     try {
//       final resolvedToken = await _resolveToken(token);
//       final response = await dio.post(
//         endPoint,
//         data: data,
//         options: _buildOptions(
//           token: resolvedToken,
//           contentType: "multipart/form-data",
//         ),
//       );
//
//       return response.data;
//     } on DioException catch (e) {
//       return _handleDioError(e);
//     }
//   }
//
//   /// DELETE REQUEST
//   Future<dynamic> delete({
//     required String endPoint,
//     Map<String, dynamic>? data,
//     String? token,
//   }) async {
//     try {
//       final resolvedToken = await _resolveToken(token);
//       final response = await dio.delete(
//         endPoint,
//         data: data,
//         options: _buildOptions(
//           token: resolvedToken,
//           contentType: ApiConstants.contentType,
//         ),
//       );
//
//       return response.data;
//     } on DioException catch (e) {
//       return _handleDioError(e);
//     }
//   }
//   /// PUT REQUEST
//   Future<dynamic> put({
//     required String endPoint,
//     required Map<String, dynamic> data,
//     String? token,
//   }) async {
//     try {
//       final resolvedToken = await _resolveToken(token);
//       final response = await dio.put(
//         endPoint,
//         data: data,
//         options: _buildOptions(
//           token: resolvedToken,
//           contentType: ApiConstants.contentType,
//         ),
//       );
//
//       return response.data;
//     } on DioException catch (e) {
//       return _handleDioError(e);
//     }
//   }
// }

