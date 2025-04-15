import 'package:flutter/material.dart';

@immutable
final class SignInData {
  const SignInData({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;
}
