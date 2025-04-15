import 'dart:async';

import 'package:dio/dio.dart';
import 'package:olkon_test_work/features/authentication/data/model/sign_in_data.dart';
import 'package:olkon_test_work/features/authentication/data/model/user.dart';
import 'package:olkon_test_work/features/authentication/domain/repository/i_user_repository.dart';
import 'package:olkon_test_work/persistence/storage/user_storage/i_user_storage.dart';

class UserRepository implements IUserRepository {
  final IUserStorage userStorage;
  final Dio dio;

  UserRepository(this.dio, {required this.userStorage});

  @override
  User getCurrentUser() => userStorage.getCurrentUser();

  @override
  Stream<User> getUserStream() async* {
    yield userStorage.getCurrentUser();
    yield* userStorage.getUserStream();
  }

  @override
  void setCurrentUser(User user) => userStorage.setCurrentUser(user);

  @override
  void signInWithCredentials(SignInData credentials) async {
    // TODO: implement signInWithCredentials
    if (credentials.username.isNotEmpty) {
      setCurrentUser(
        User.authorized(name: credentials.username),
      );
    } else {
      setCurrentUser(
        const User.unauthorized(),
      );
    }
  }
}

enum UserStorageKeys {
  user('user');

  final String keyName;
  const UserStorageKeys(this.keyName);
}
