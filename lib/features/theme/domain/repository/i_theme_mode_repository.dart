import 'package:flutter/material.dart';

abstract class IThemeModeRepository {
  void setThemeMode(ThemeMode themeMode);
  ThemeMode? getThemeMode();
}