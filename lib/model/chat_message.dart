import 'package:self_chat/model/index.dart';
import 'package:self_chat/model/user.dart';

enum ChatMessageType {
  message,
  date,
}

class ChatMessage {
  final ChatMessageType type;
  final User user;
  final String message;
  final DateTime time;

  ChatMessage({
    this.type = ChatMessageType.message,
    required this.user,
    required this.message,
    required this.time,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        type: json['type'] == ChatMessageType.message.toString()
            ? ChatMessageType.message
            : ChatMessageType.date,
        user: User.fromJson(json['user']),
        message: json['message'],
        time: DateTime.parse(json['time']),
      );

  Map<String, dynamic> toJson() => {
        'type': type.toString(),
        'user': user.toJson(),
        'message': message,
        'time': time.toString(),
      };
}
