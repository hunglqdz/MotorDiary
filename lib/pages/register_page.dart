import 'package:flutter/material.dart';
import 'package:motor_diary/constants/routes.dart';
import 'package:motor_diary/services/auth/auth_service.dart';

import '../services/auth/auth_exceptions.dart';
import '../utilities/dialogs/error_dialog.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Column(
                children: [
                  TextField(
                    controller: _email,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email here',
                    ),
                  ),
                  TextField(
                    controller: _password,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      hintText: 'Enter your password here',
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;
                      try {
                        await AuthService.firebase().createUser(
                          email: email,
                          password: password,
                        );
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          mainRoute,
                          (route) => false,
                        );
                      } on WeakPasswordAuthException {
                        await showErrorDialog(
                          context,
                          'Weak password',
                        );
                      } on EmailAlreadyInUseAuthException {
                        await showErrorDialog(
                          context,
                          'Email is already in use',
                        );
                      } on InvalidEmailAuthException {
                        await showErrorDialog(
                          context,
                          'This is an invalid email address',
                        );
                      } on GenericAuthException {
                        await showErrorDialog(
                          context,
                          'Failed to register',
                        );
                      }
                    },
                    child: const Text('Register'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        loginRoute,
                        (route) => false,
                      );
                    },
                    child: const Text('Already registered? Login here!'),
                  )
                ],
              );
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
