import 'dart:async';

import 'package:olkon_test_work/features/authentication/data/model/sign_in_data.dart';
import 'package:olkon_test_work/features/authentication/data/model/user.dart';

/// {@template IUserRepository.class}
/// An Interface of the repository for authenticating and retrieving saved user data 
/// {@endtemplate}
abstract class IUserRepository {
  Stream<User> getUserStream();
  User getCurrentUser();
  void setCurrentUser(User user);
  void signInWithCredentials(SignInData credentials);
}
