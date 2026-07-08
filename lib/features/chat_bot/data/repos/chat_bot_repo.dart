// features/chatbot/data/repos/chatbot_repo.dart

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/chat_response_entity.dart';

abstract class ChatbotRepo {
  Future<Either<Failure, ChatResponseEntity>> ask({required String question});
}