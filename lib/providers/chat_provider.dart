import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:self_chat/model/index.dart';
import 'package:self_chat/providers/chat_repository_provider.dart';
import 'package:self_chat/repository/index.dart';

final chatProvider = StateNotifierProvider<ChatNotifier, ChatRoom?>(
  (ref) => ChatNotifier(storage: ref.read(chatRepositoryProvider)),
);

class ChatNotifier extends StateNotifier<ChatRoom?> {
  final Repository<ChatRoom?> storage;

  ChatNotifier({required this.storage}) : super(null);

  init() async {
    if (state == null) {
      final stored = await storage.read();
      if (stored is ChatRoom) state = stored;
    }
  }

  Future appendMessage(ChatMessage message) async {
    state = ChatRoom(
      participants: state?.participants ?? [],
      messages: [message, ...state?.messages ?? []],
    );
    await storage.write(state);
  }
}
