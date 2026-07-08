// features/chatbot/data/models/chat_response_model.dart

import '../entities/chat_response_entity.dart';

class ChatResponseModel extends ChatResponseEntity {
  ChatResponseModel({
    required super.question,
    required super.answer,
  });

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    return ChatResponseModel(
      question: json['question'] ?? '',
      answer: json['answer'] ?? '',
    );
  }
}