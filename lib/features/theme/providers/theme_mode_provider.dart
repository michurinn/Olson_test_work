import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:olkon_test_work/app/di_scope.dart';
import 'package:olkon_test_work/features/theme/controllers/theme_mode_controller.dart';
import 'package:olkon_test_work/features/theme/di/theme_mode_scope.dart';
import 'package:olkon_test_work/features/theme/providers/theme_mode_widget.dart';
import 'package:provider/provider.dart';

class ThemeModeProvider extends SingleChildStatelessWidget {
  const ThemeModeProvider({
    super.key,
  });

  static ThemeModeController of(BuildContext ctx) =>
      Provider.of<ThemeModeController>(ctx, listen: false);

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return DiScope<IThemeModeScope>(
      factory: ThemeModeScope.createScope,
      child: ThemeModeWidget(
        themeModeBuilder: (context, theme) => child ?? const SizedBox.shrink(),
      ),
      onDispose: (value) => value.dispose,
    );
  }
}
