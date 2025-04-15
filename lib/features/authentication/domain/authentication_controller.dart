import 'dart:async';

import 'package:flutter/material.dart';
import 'package:olkon_test_work/features/authentication/data/model/sign_in_data.dart';
import 'package:olkon_test_work/features/authentication/data/model/user.dart';
import 'package:olkon_test_work/features/authentication/domain/repository/i_user_repository.dart';

class AuthenticationController with ChangeNotifier {
  final IUserRepository _userRepository;

  AuthenticationController({required IUserRepository userRepository})
      : _userRepository = userRepository {
    _userSubscription = _userRepository.getUserStream().listen((user) {
      currentUser = user;
      notifyListeners();
    });
  }
  StreamSubscription<User>? _userSubscription;
  User currentUser = const User.unauthorized();

  @override
  void dispose() {
    _userSubscription?.cancel();
    super.dispose();
  }

  void signIn(SignInData credentials) async {
    _userRepository.signInWithCredentials(credentials);
  }

  void signOut() {
    /// TODO(me): add dispose of db rows
    _userRepository.setCurrentUser(
      const User.unauthorized(),
    );
  }

  User getUser() {
    return currentUser;
  }
}

enum AuthState { auth, noAuth }
