import 'dart:async';

import 'package:olkon_test_work/features/authentication/data/model/user.dart';
import 'package:olkon_test_work/persistence/storage/user_storage/i_user_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStorage implements IUserStorage {
  final SharedPreferences prefs;
  final StreamController<User> _userStream = StreamController<User>.broadcast();
  UserStorage({required this.prefs});

  @override
  User getCurrentUser() {
    if (prefs.containsKey(UserStorageKeys.user.name)) {
      final value = prefs.getString(UserStorageKeys.user.name);
      _userStream.add(
        value == null
            ? const User.unauthorized()
            : User.authorized(name: value),
      );
      return value == null
          ? const User.unauthorized()
          : User.authorized(name: value);
    } else {
      _userStream.add(
        const User.unauthorized(),
      );
      return const User.unauthorized();
    }
  }

  @override
  Stream<User> getUserStream() {
    return _userStream.stream;
  }

  @override
  void setCurrentUser(User user) {
    if (!user.isAuthenticated) {
      prefs.remove(
        UserStorageKeys.user.name,
      );
      _userStream.add(
        const User.unauthorized(),
      );
    } else {
      prefs.setString(UserStorageKeys.user.name, user.name ?? 'Unknown name');
      _userStream.add(
        User.authorized(name: user.name ?? 'Unknown name'),
      );
    }
  }
}

enum UserStorageKeys {
  user('user');

  final String keyName;
  const UserStorageKeys(this.keyName);
}
