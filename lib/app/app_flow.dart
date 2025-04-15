import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:olkon_test_work/app/app_scope.dart';
import 'package:olkon_test_work/app/di_scope.dart';
import 'package:olkon_test_work/features/theme/providers/theme_mode_provider.dart';
import 'package:olkon_test_work/main.dart';

class AppFlow extends StatelessWidget {
  const AppFlow({
    required this.appScope,
    super.key,
  });

  final IAppScope appScope;

  @override
  Widget build(BuildContext context) {
    return Nested(
      children: [
        DiScope<IAppScope>(
          factory: (context) => appScope,
          child: const MyApp(),
        ),
        const ThemeModeProvider(),
      ],
      child: const MyApp(),
    );
  }
}
