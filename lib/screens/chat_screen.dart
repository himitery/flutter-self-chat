import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:self_chat/providers/index.dart';
import 'package:self_chat/providers/user_provider.dart';
import 'package:self_chat/widgets/chat_input_widget.dart';
import 'package:self_chat/widgets/chat_item_widget.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(chatProvider.notifier).init();

    final messages = ref.watch(
      chatProvider.select((room) => room?.messages ?? []),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          users
              .firstWhere((e) => e.nickname != ref.watch(userProvider).nickname)
              .nickname,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: GestureDetector(
              onTap: () => _handleOnTap(ref),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  ref.read(userProvider).profileImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) =>
                      ChatItemWidget(chat: messages[index]),
                ),
              ),
            ),
            const ChatInputWidget(),
          ],
        ),
      ),
    );
  }

  _handleOnTap(WidgetRef ref) {
    ref.read(userProvider.notifier).state = users.firstWhere(
      (e) => e.nickname != ref.read(userProvider).nickname,
    );
  }
}
