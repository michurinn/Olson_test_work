import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:octopus/octopus.dart';
import 'package:olkon_test_work/app/app_flow.dart';
import 'package:olkon_test_work/app/app_scope.dart';
import 'package:olkon_test_work/app/app_scope_register.dart';
import 'package:olkon_test_work/extensions/theme_extensions/theme_colors.dart';
import 'package:olkon_test_work/extensions/theme_extensions/theme_text_styles.dart';
import 'package:olkon_test_work/features/authentication/presentation/presentation/widgets/authentification_inherited_widget.dart';
import 'package:olkon_test_work/features/theme/providers/theme_mode_widget.dart';
import 'package:olkon_test_work/navigation/guards/login_guard.dart';
import 'package:olkon_test_work/navigation/pages.dart';
import 'package:olkon_test_work/styles/app_colors.dart';
import 'package:olkon_test_work/urls/urls.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized().scheduleWarmUpFrame();

  runApp(
    AppFlow(
      appScope: await const AppScopeRegister().createScope(Urls.baseUrl),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ThemeModeWidget(
      themeModeBuilder: (_, theme) {
        if (kDebugMode) {
          log(theme.name, name: 'ThemeBuilder');
        }
        return MaterialApp.router(
          routerConfig: Octopus(
            guards: [
              LoginGuard(
                user: () => context
                    .read<IAppScope>()
                    .authenticationController
                    .currentUser,
                routes: {Routes.login.name},
                refresh: context.read<IAppScope>().authenticationController,
                signinNavigation: OctopusState.single(
                  Routes.login.node(),
                ),
                homeNavigation: OctopusState.single(
                  Routes.articles.node(),
                ),
              ),
            ],
            routes: Routes.values,
            defaultRoute: Routes.articles,
          ).config,
          title: 'Flutter Demo',
          themeMode: theme,
          darkTheme: ThemeData.dark().copyWith(extensions: [
            ThemeTextStyles.dark(),
            ThemeColors.dark(),
          ]),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            extensions: [
              ThemeTextStyles.light(),
              ThemeColors.light(),
            ],
            useMaterial3: true,
          ),
          builder: (context, child) => AuthenticationScope(
            child: child ?? const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
