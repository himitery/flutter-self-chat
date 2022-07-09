import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:self_chat/repository/index.dart';

final chatRepositoryProvider = Provider((ref) => ChatRepository());
