import 'dart:async';

import 'package:olkon_test_work/features/authentication/data/model/sign_in_data.dart';
import 'package:olkon_test_work/features/authentication/data/model/user.dart';

abstract class IUserRepository {
  Stream<User> getUserStream();
  User getCurrentUser();
  void setCurrentUser(User user);
  void signInWithCredentials(SignInData credentials);
}
