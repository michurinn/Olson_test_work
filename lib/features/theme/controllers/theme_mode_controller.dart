import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:olkon_test_work/features/theme/domain/repository/i_theme_mode_repository.dart';

class ThemeModeController extends ValueNotifier<ThemeMode> {
  final IThemeModeRepository themeRepository;

  void swipeTheme() {
    themeRepository.setThemeMode(
        (themeRepository.getThemeMode() ?? ThemeMode.light) == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light);
    value = themeRepository.getThemeMode() ?? ThemeMode.system;
  }

  ThemeModeController(super._value, {required this.themeRepository});
}
