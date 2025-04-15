import 'package:flutter/material.dart';
import 'package:olkon_test_work/extensions/theme_extensions/theme_text_styles.dart';

// Extension для получения ThemeExtension текущей темы
extension BuildContextThemeTextStylesExtension on BuildContext {
  // Получить используемые  ThemeTextStyles в теме ThemeExtension
  ThemeTextStyles get themeTextStyle =>
      Theme.of(this).extension<ThemeTextStyles>()!;
}
