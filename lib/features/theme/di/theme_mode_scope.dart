import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olkon_test_work/app/app_scope.dart';
import 'package:olkon_test_work/features/theme/controllers/theme_mode_controller.dart';
import 'package:olkon_test_work/features/theme/data/repository/theme_mode_repository.dart';
import 'package:olkon_test_work/features/theme/domain/repository/i_theme_mode_repository.dart';
import 'package:olkon_test_work/persistence/storage/theme_storage/theme_mode_storage.dart';
import 'package:olkon_test_work/utils/disposable_object/disposable_object.dart';
import 'package:olkon_test_work/utils/disposable_object/i_disposable_object.dart';

class ThemeModeScope extends DisposableObject implements IThemeModeScope {
  @override
  final IThemeModeRepository repository;

  @override
  final ThemeModeController themeModeController;

  factory ThemeModeScope.createScope(BuildContext context) {
    final repository = ThemeModeRepository(
      storage: ThemeModeStorage(context.read<IAppScope>().sharedPreferences),
    );
    return ThemeModeScope(
      repository: repository,
      themeModeController: ThemeModeController(
          repository.getThemeMode() ?? ThemeMode.system,
          themeRepository: repository),
    );
  }

  ThemeModeScope({
    required this.repository,
    required this.themeModeController,
  });
}

abstract class IThemeModeScope implements IDisposableObject {
  IThemeModeRepository get repository;

  ThemeModeController get themeModeController;
}
