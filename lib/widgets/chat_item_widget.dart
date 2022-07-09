import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:self_chat/model/index.dart';
import 'package:self_chat/providers/user_provider.dart';

class ChatItemWidget extends HookConsumerWidget {
  final ChatMessage chat;

  const ChatItemWidget({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(userProvider);

    return Container(
      width: double.maxFinite,
      alignment: currentUser.nickname == chat.user.nickname
          ? Alignment.centerRight
          : Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color(0xFFF3F3F3),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(chat.message),
      ),
    );
  }
}
