import 'package:flutter/src/material/app.dart';
import 'package:olkon_test_work/features/theme/domain/repository/i_theme_mode_repository.dart';
import 'package:olkon_test_work/persistence/storage/theme_storage/i_theme_mode_storage.dart';

class ThemeModeRepository implements IThemeModeRepository {
  final IThemeModeStorage storage;

  ThemeModeRepository({required this.storage});
  @override
  ThemeMode? getThemeMode() {
    return storage.getThemeMode();
  }

  @override
  void setThemeMode(ThemeMode themeMode) async {
    await storage.saveThemeMode(mode: themeMode);
  }
}
