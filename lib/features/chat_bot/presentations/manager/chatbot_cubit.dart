// features/chatbot/presentation/manager/chatbot_cubit/chatbot_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/entities/chat_response_entity.dart';
import '../../data/repos/chat_bot_repo.dart';

part 'chatbot_state.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  final ChatbotRepo chatbotRepo;

  ChatbotCubit(this.chatbotRepo) : super(ChatbotInitial());

  Future<void> ask({required String question}) async {
    emit(ChatbotLoading());
    final result = await chatbotRepo.ask(question: question);
    result.fold(
          (failure) => emit(ChatbotFailure(errorMessage: failure.errorMessage)),
          (response) => emit(ChatbotSuccess(response: response)),
    );
  }
}