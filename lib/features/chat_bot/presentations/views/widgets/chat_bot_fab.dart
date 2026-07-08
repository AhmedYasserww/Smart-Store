// features/chatbot/presentation/views/widgets/chatbot_fab.dart
import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';

import '../chat_bot_view.dart';
class ChatbotFab extends StatelessWidget {
  const ChatbotFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed(ChatbotView.routeName);
      },
      backgroundColor: AppColors.primaryColor,
      shape: const CircleBorder(),
      child: const Icon(Icons.help_outline, color: Colors.white, size: 28),
    );
  }
}