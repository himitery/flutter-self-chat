import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:self_chat/model/index.dart';
import 'package:self_chat/providers/index.dart';
import 'package:self_chat/providers/user_provider.dart';

class ChatInputWidget extends HookConsumerWidget {
  const ChatInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    final focus = FocusNode();

    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFFE9E9E9),
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: controller,
              focusNode: focus,
              onSubmitted: (_) => _sendMessage(ref, controller, focus),
              decoration: const InputDecoration(
                hintText: '메시지를 입력해주세요.',
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
            child: GestureDetector(
              onTap: () => _sendMessage(ref, controller, focus),
              child: SvgPicture.asset(
                'assets/icon/send.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(
    WidgetRef ref,
    TextEditingController controller,
    FocusNode focus,
  ) {
    if (controller.text.isEmpty) return;
    ref
        .read(chatProvider.notifier)
        .appendMessage(
          ChatMessage(
            user: ref.watch(userProvider),
            message: controller.text,
            time: DateTime.now(),
          ),
        )
        .then((_) => controller.clear())
        .then((_) => focus.requestFocus());
  }
}
