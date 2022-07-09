import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:self_chat/model/index.dart';

final users = [
  User(
    nickname: 'himitery',
    profileImage: 'https://avatars.githubusercontent.com/u/65934968?v=4',
  ),
  User(
    nickname: 'flutter',
    profileImage: 'https://avatars.githubusercontent.com/u/14101776?s=200&v=4',
  ),
];

final userProvider = StateProvider((ref) => users[0]);
