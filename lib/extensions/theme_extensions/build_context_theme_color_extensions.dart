import 'package:flutter/material.dart';
import 'package:olkon_test_work/extensions/theme_extensions/theme_colors.dart';

// Extension для получения ThemeExtension текущей темы
extension BuildContextThemeColorExtension on BuildContext {
  // Получить используемые  ThemeColors в теме ThemeExtension
  ThemeColors? get color => Theme.of(this).extension<ThemeColors>();
}
