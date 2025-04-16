import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olkon_test_work/app/app_scope.dart';
import 'package:olkon_test_work/features/authentication/data/model/sign_in_data.dart';
import 'package:olkon_test_work/features/authentication/data/model/user.dart';
import 'package:olkon_test_work/features/authentication/domain/authentication_controller.dart';

/// {@template AuthenticationScope.class}
/// Changes the global state when the Authenticaion Controller state is changed
/// {@endtemplate}
class AuthenticationScope extends StatefulWidget {
  const AuthenticationScope({super.key, required this.child});
  final Widget child;

  static User userOf(BuildContext context) =>
      _AuthentificationInheritedWidget.userOf(context);

  static AuthenticationController controllerOf(BuildContext context) =>
      _AuthentificationInheritedWidget.of(context);

  static void signIn(BuildContext context, SignInData data) =>
      _AuthentificationInheritedWidget.of(context).signIn(data);

  static void signOut(BuildContext context) =>
      _AuthentificationInheritedWidget.of(context).signOut();

  @override
  State<AuthenticationScope> createState() => _AuthenticationScopeState();
}

class _AuthenticationScopeState extends State<AuthenticationScope> {
  late final AuthenticationController authenticationController;

  @override
  void initState() {
    super.initState();
    authenticationController = context
        .read<IAppScope>()
        .authenticationController
      ..addListener(_listener);
  }

  void _listener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    authenticationController.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _AuthentificationInheritedWidget(
      controller: authenticationController,
      state: authenticationController.currentUser,
      child: widget.child,
    );
  }
}

class _AuthentificationInheritedWidget extends InheritedWidget {
  const _AuthentificationInheritedWidget({
    super.key,
    required super.child,
    required this.controller,
    required this.state,
  });
  final AuthenticationController controller;
  final User state;
  static User userOf(BuildContext ctx) =>
      ctx
          .dependOnInheritedWidgetOfExactType<
              _AuthentificationInheritedWidget>()
          ?.controller
          .currentUser ??
      const User.unauthorized();
  static AuthenticationController of(BuildContext ctx) =>
      ctx
          .dependOnInheritedWidgetOfExactType<
              _AuthentificationInheritedWidget>()
          ?.controller ??
      _notFoud();
  static Never _notFoud() =>
      throw ArgumentError('Not found _AuthentificationInheritedWidget');
  @override
  bool updateShouldNotify(
          covariant _AuthentificationInheritedWidget oldWidget) =>
      !identical(oldWidget.state, state);
}
