import 'package:flutter/material.dart';

/// {@template SignInData.class}
/// Credentials for authentication
/// {@endtemplate}
@immutable
final class SignInData {
  const SignInData({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;
}
