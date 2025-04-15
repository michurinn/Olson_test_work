import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:olkon_test_work/app/app_config.dart';
import 'package:olkon_test_work/app/app_dio_configurator.dart';
import 'package:olkon_test_work/app/app_scope.dart';
import 'package:olkon_test_work/core/database/app_database.dart';
import 'package:olkon_test_work/features/authentication/data/repository/user_repository.dart';
import 'package:olkon_test_work/features/authentication/domain/authentication_controller.dart';
import 'package:olkon_test_work/persistence/storage/tokens_storage/auth_token_pair.dart';
import 'package:olkon_test_work/persistence/storage/tokens_storage/token_storage_impl.dart';
import 'package:olkon_test_work/persistence/storage/user_storage/user_storage.dart';

import 'package:shared_preferences/shared_preferences.dart';

final class AppScopeRegister {
  const AppScopeRegister();

  /// Create scope.
  Future<IAppScope> createScope(String baseUrl) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    const tokenStorage = TokenStorageImpl(
      FlutterSecureStorage(),
    );

    final db = AppDatabase();

    final appConfig = _createAppConfig(
      baseUrl,
      sharedPreferences,
      tokenStorage,
      db,
    );

    const dioConfigurator = AppDioConfigurator();

    /// Check the auth state at every run

    final ValueNotifier<bool> loggedNotifier = ValueNotifier(
        (await appConfig.tokenStorage.read()) != null ? true : false);

    /// TODO(me): remake it
    loggedNotifier.addListener(
      () async {
        if (!loggedNotifier.value) {
          await appConfig.tokenStorage.delete();
          await db.newsDao.deleteAllNews();
        }
      },
    );
    final dio = dioConfigurator.create(
      tokenStorage: appConfig.tokenStorage,
      url: appConfig.url,
      logout: () async {
        loggedNotifier.value = false;
      },
    );

    return AppScope(
      appConfig: appConfig,
      sharedPreferences: sharedPreferences,
      dio: dio,
      authenticationController: AuthenticationController(
        userRepository: UserRepository(
            userStorage: UserStorage(prefs: sharedPreferences), dio),
      ),
    );
  }

  AppConfig _createAppConfig(String baseUrl, SharedPreferences prefs,
      TokenStorage tokenStorage, AppDatabase db) {
    return AppConfig(
      url: baseUrl,
      database: db,
      tokenStorage: tokenStorage as TokenStorage<AuthTokenPair>,
    );
  }
}
