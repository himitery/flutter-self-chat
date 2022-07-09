import 'dart:convert';

import 'package:self_chat/model/index.dart';
import 'package:self_chat/repository/index.dart';

class ChatRepository extends Repository<ChatRoom> {
  ChatRepository() : super(key: 'key_chat');

  @override
  Future<void> delete() async {
    await storage.delete(key: key);
    cache = null;
  }

  @override
  Future<ChatRoom?> read() async {
    if (cache == null) {
      final stored = await storage.read(key: key);
      if (stored is String) cache = ChatRoom.fromJson(jsonDecode(stored));
    }
    return cache;
  }

  @override
  Future<ChatRoom> write(ChatRoom data) async {
    await storage.write(key: key, value: jsonEncode(data.toJson()));
    cache = data;
    return cache!;
  }
}
