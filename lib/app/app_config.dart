import 'package:fresh_dio/fresh_dio.dart';
import 'package:olkon_test_work/core/database/app_database.dart';
import 'package:olkon_test_work/persistence/storage/tokens_storage/auth_token_pair.dart';

/// {@template app_config.class}
/// Application configuration.
/// {@endtemplate}
class AppConfig {
  /// Базовый url.
  final String url;

  ///  <L
  final AppDatabase database;

  final TokenStorage<AuthTokenPair> tokenStorage;

  /// {@macro app_config.class}
  const AppConfig({
    required this.url,
    required this.database,
    required this.tokenStorage,
  });
}
