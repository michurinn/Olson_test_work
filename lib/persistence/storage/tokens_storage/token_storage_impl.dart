import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:olkon_test_work/persistence/storage/tokens_storage/auth_token_pair.dart';


final class TokenStorageImpl implements TokenStorage<AuthTokenPair> {
  final FlutterSecureStorage _secureStorage;

  const TokenStorageImpl(this._secureStorage);

  @override
  Future<AuthTokenPair?> read() async {
    final tokenJson = await _secureStorage.read(key: TokensStorageKeys.authToken.keyName);
    if (tokenJson == null) return null;
    return AuthTokenPair.fromJson(jsonDecode(tokenJson) as Map<String, dynamic>);
  }

  @override
  Future<void> write(AuthTokenPair token) {
    return _secureStorage.write(
      key: TokensStorageKeys.authToken.keyName,
      value: jsonEncode(token.toJson()),
    );
  }

  @override
  Future<void> delete() async {
    for (final key in TokensStorageKeys.values) {
      await _secureStorage.delete(key: key.keyName);
    }
  }
}

enum TokensStorageKeys {
  authToken('app_auth_token');
  final String keyName;
  const TokensStorageKeys(this.keyName);
}
