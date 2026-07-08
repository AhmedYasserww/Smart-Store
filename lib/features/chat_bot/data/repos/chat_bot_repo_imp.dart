import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/end_points.dart';
import '../entities/chat_response_entity.dart';
import '../models/chat_response_model.dart';
import 'chat_bot_repo.dart';

class ChatbotRepoImpl implements ChatbotRepo {
  final ApiService apiService;

  ChatbotRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, ChatResponseEntity>> ask({
    required String question,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.chatbot,
        data: {'question': question},
      );

      log('🤖 Chatbot Response: $response');

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 && response['succeeded'] == true) {
          return right(ChatResponseModel.fromJson(response['data']));
        } else {
          return left(ServerFailure(
            errorMessage: message ?? 'Failed to get response',
          ));
        }
      }
      return left(ServerFailure(errorMessage: 'Unexpected API response format'));
    } on DioException catch (e) {
      log('❌ DioException (Chatbot): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (Chatbot): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}