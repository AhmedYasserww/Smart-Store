import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_style.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../auth/data/entities/chat_message_entity.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message});
  final ChatMessageEntity message;

  String _formatTime(DateTime time) {
    final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    final isBot = message.isBot;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment:
        isBot ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment:
            isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Bot avatar
              if (isBot) ...[
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.primaryColor,
                  child: SvgPicture.asset(AppImages.personChatBot),

                ),
                const SizedBox(width: 8),
              ],

              // ✅ Message bubble
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: isBot ? Colors.white : AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: Radius.circular(isBot ? 4 : 16),
                      bottomRight: Radius.circular(isBot ? 16 : 4),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    message.message,
                    style: AppStyle.styleRegular14.copyWith(
                      color: isBot ? Colors.black87 : Colors.white,
                    ),
                  ),
                ),
              ),

              if (!isBot) const SizedBox(width: 8),
            ],
          ),

          // ✅ Time
          Padding(
            padding: EdgeInsets.only(
              left: isBot ? 44 : 0,
              top: 8,
            ),
            child: Text(
              _formatTime(message.time),
              style: AppStyle.styleGreyRegular12,
            ),
          ),
        ],
      ),
    );
  }
}