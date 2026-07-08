import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_style.dart';
import '../../../../auth/data/entities/chat_message_entity.dart';
import '../../manager/chatbot_cubit.dart';
import 'chat_bubble.dart';

class ChatbotViewBody extends StatefulWidget {
  const ChatbotViewBody({super.key});

  @override
  State<ChatbotViewBody> createState() => _ChatbotViewBodyState();
}

class _ChatbotViewBodyState extends State<ChatbotViewBody> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<ChatMessageEntity> _messages = [
    ChatMessageEntity(
      message: 'Hello! Welcome to our support team. How can I help you today?',
      isBot: true,
      time: DateTime.now(),
    ),
    ChatMessageEntity(
      message: "I'm here to assist you with any questions about our store.",
      isBot: true,
      time: DateTime.now(),
    ),
  ];

  bool _isLoading = false;

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty || _isLoading) return;

    setState(() {
      _messages.add(ChatMessageEntity(
        message: text,
        isBot: false,
        time: DateTime.now(),
      ));
      _isLoading = true;
    });

    _controller.clear();
    _scrollToBottom();

    context.read<ChatbotCubit>().ask(question: text);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatbotCubit, ChatbotState>(
      listener: (context, state) {
        if (state is ChatbotSuccess) {
          setState(() {
            _messages.add(ChatMessageEntity(
              message: state.response.answer,
              isBot: true,
              time: DateTime.now(),
            ));
            _isLoading = false;
          });
          _scrollToBottom();
        }

        if (state is ChatbotFailure) {
          setState(() {
            _messages.add(ChatMessageEntity(
              message: 'Sorry, something went wrong. Please try again.',
              isBot: true,
              time: DateTime.now(),
            ));
            _isLoading = false;
          });
          _scrollToBottom();
        }
      },
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              itemCount: _messages.length + (_isLoading ? 1 : 0),
              itemBuilder: (_, index) {
                // ✅ Typing indicator
                if (_isLoading && index == _messages.length) {
                  return const _TypingIndicator();
                }
                return ChatBubble(message: _messages[index]);
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (_) => _sendMessage(),
                      decoration: InputDecoration(
                        hintText: 'Ask a question...',
                        hintStyle: AppStyle.styleGreyRegular14,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _sendMessage,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: _isLoading
                            ? AppColors.primaryColor.withOpacity(0.5)
                            : AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _TypingIndicator extends StatefulWidget {
  const _TypingIndicator();

  @override
  State<_TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<_TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.primaryColor,
            child: const Icon(Icons.smart_toy, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(4),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (i) {
                    final delay = i * 0.3;
                    final t = (_controller.value - delay).clamp(0.0, 1.0);
                    final opacity = (t < 0.5 ? t * 2 : (1 - t) * 2)
                        .clamp(0.3, 1.0);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Opacity(
                        opacity: opacity,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}