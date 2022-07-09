import 'package:self_chat/model/index.dart';

class ChatRoom {
  final List<User> participants;
  final List<ChatMessage> messages;

  ChatRoom({required this.participants, required this.messages});

  factory ChatRoom.fromJson(Map<String, dynamic> json) => ChatRoom(
        participants: List<Map<String, dynamic>>.from(json['participants'])
            .map((e) => User.fromJson(e))
            .toList(),
        messages: List<Map<String, dynamic>>.from(json['messages'])
            .map((e) => ChatMessage.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'participants': participants.map((e) => e.toJson()).toList(),
        'messages': messages.map((e) => e.toJson()).toList(),
      };
}
