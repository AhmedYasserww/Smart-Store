// chatbot_state.dart
part of 'chatbot_cubit.dart';

@immutable
sealed class ChatbotState {}

class ChatbotInitial extends ChatbotState {}
class ChatbotLoading extends ChatbotState {}

class ChatbotSuccess extends ChatbotState {
  final ChatResponseEntity response;
  ChatbotSuccess({required this.response});
}

class ChatbotFailure extends ChatbotState {
  final String errorMessage;
  ChatbotFailure({required this.errorMessage});
}