import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class Repository<T> {
  final storage = const FlutterSecureStorage();
  final String key;
  late T? cache;

  Repository({required this.key}) : cache = null;

  Future<T?> read();

  Future<T> write(T data);

  Future<void> delete();
}
