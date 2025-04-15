import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:olkon_test_work/persistence/storage/tokens_storage/auth_token_pair.dart';
import 'package:olkon_test_work/persistence/storage/tokens_storage/token_storage_impl.dart';

/// {@template app_dio_configurator.class}
/// The base class with client configuration of [Dio].
/// {@endtemplate}
class AppDioConfigurator {
  /// {@macro app_dio_configurator.class}
  const AppDioConfigurator();

  /// Creating a client [Dio].
  Dio create({
    required TokenStorage<AuthTokenPair> tokenStorage,
    required String url,
    String? proxyUrl,
    AsyncCallback? logout,
  }) {
    const timeout = Duration(seconds: 15);

    final dio = Dio();

    dio.options
      ..baseUrl = url
      ..responseType = ResponseType.json
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      if (proxyUrl != null && proxyUrl.isNotEmpty) {
        client
          ..findProxy = (uri) {
            return 'PROXY $proxyUrl';
          }
          ..badCertificateCallback = (_, __, ___) {
            return true;
          };
      }

      return client;
    };

    final interceptors = <Interceptor>[
      Fresh(
          tokenStorage: const TokenStorageImpl(
            FlutterSecureStorage(),
          ),
          /// TODO(me): implement refresh token strategy with logout callback then refreshing is not possible
          refreshToken: (token, httpClient) => Future.value(token),
          tokenHeader: (AuthTokenPair token) {
            return {'Authorization': 'Bearer ${token.accessToken}'};
          }),
    ];

    dio.interceptors.addAll(interceptors);

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }

    return dio;
  }
}
