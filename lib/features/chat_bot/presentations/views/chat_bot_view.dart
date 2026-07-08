import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/service_locator/service_locator.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/features/chat_bot/presentations/views/widgets/chat_bot_view_body.dart';

import '../../data/repos/chat_bot_repo_imp.dart';
import '../manager/chatbot_cubit.dart';

class ChatbotView extends StatelessWidget {
  const ChatbotView({super.key});
  static const String routeName = 'chatbot_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatbotCubit(getIt<ChatbotRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                'Smart Store Chatbot',
                style: AppStyle.styleSemiBold16.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                'Online · Average reply time: 2 min',
                style: AppStyle.styleRegular12.copyWith(
                  color: Colors.white.withOpacity(0.85),
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
        body: const ChatbotViewBody(),
      ),
    );
  }
}