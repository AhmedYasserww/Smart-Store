class ChatMessageEntity {
  final String message;
  final bool isBot;
  final DateTime time;

  ChatMessageEntity({
    required this.message,
    required this.isBot,
    required this.time,
  });
}