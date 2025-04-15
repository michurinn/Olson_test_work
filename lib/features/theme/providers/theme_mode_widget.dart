import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:olkon_test_work/features/theme/di/theme_mode_scope.dart';
import 'package:olkon_test_work/features/theme/providers/theme_mode_provider.dart';
import 'package:provider/provider.dart';

typedef ThemeModeBuilder = Widget Function(
    BuildContext context, ThemeMode theme);

class ThemeModeWidget extends StatefulWidget {
  const ThemeModeWidget({super.key, required this.themeModeBuilder});
  final ThemeModeBuilder themeModeBuilder;
  @override
  State<ThemeModeWidget> createState() => _ThemeModeWidgetState();
}

class _ThemeModeWidgetState extends State<ThemeModeWidget> {
  late final ValueListenable<ThemeMode> valueListenableTheme;

  @override
  void initState() {
    super.initState();
    valueListenableTheme = context.read<IThemeModeScope>().themeModeController;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueListenableTheme,
      builder: (context, value, child) =>
          widget.themeModeBuilder(context, value),
    );
  }
}
