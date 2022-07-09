import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:self_chat/model/index.dart';
import 'package:self_chat/providers/index.dart';
import 'package:self_chat/providers/user_provider.dart';
import 'package:self_chat/screens/chat_screen.dart';

void main() => runApp(const ProviderScope(child: App()));

class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(chatRepositoryProvider).read().then((value) {
      if (value == null) {
        ref.read(chatRepositoryProvider).write(
              ChatRoom(
                participants: users,
                messages: [],
              ),
            );
      }
    });

    return MaterialApp(
      title: 'Self Chat',
      theme: ThemeData(
        primaryColor: const Color(0xFFEC6B52),
        backgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            toolbarHeight: 58,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Color(0xFFEC6B52),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            shape: Border(
              bottom: BorderSide(
                color: Color(0xFFE9E9E9),
                style: BorderStyle.solid,
              ),
            )),
      ),
      debugShowCheckedModeBanner: false,
      home: const ChatScreen(),
    );
  }
}
