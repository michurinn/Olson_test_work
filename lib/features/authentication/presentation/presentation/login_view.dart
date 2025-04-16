import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:octopus/octopus.dart';
import 'package:olkon_test_work/app/app_scope.dart';
import 'package:olkon_test_work/features/authentication/data/model/sign_in_data.dart';
import 'package:olkon_test_work/features/authentication/presentation/presentation/widgets/text_field.dart';
import 'package:olkon_test_work/navigation/pages.dart';
import 'package:olkon_test_work/persistence/storage/tokens_storage/auth_token_pair.dart';
/// {@template LoginView.class}
/// Login Screen
/// {@endtemplate}
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _loginTextEditingCOntroller;

  @override
  void initState() {
    super.initState();
    _loginTextEditingCOntroller = TextEditingController();
  }

  @override
  void dispose() {
    _loginTextEditingCOntroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            OlkonTextField(
              hintText: 'Login',
              onChanged: (value) => _loginTextEditingCOntroller.text = value,
            ),
            const SizedBox(
              height: 16,
            ),
            const OlkonTextField(
              hintText: 'Password',
            ),
            const SizedBox(
              height: 16,
            ),
            OutlinedButton.icon(
              onPressed: () async {
                /// TODO(me): login here
                context.read<IAppScope>().authenticationController.signIn(
                      SignInData(
                          username: _loginTextEditingCOntroller.value.text,
                          password: 'Mocked password'),
                    );
                await context.read<IAppScope>().appConfig.tokenStorage.write(
                      const AuthTokenPair(
                          accessToken: 'olkon test access token',
                          refreshToken: 'olkon test refresh token'),
                    );
                context.octopus.setState(
                  (state) => OctopusState.single(
                    Routes.articles.node(),
                  ),
                );
              },
              label: const Text('Login'),
              icon: const Icon(Icons.login),
            ),
          ],
        ),
      ),
    );
  }
}
