import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/my_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Enter your email and we will send you a password reset link',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: emailController,
              hintText: 'email',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: passwordReset,
              color: Colors.deepPurple[200],
              child: const Text('Reset Password'),
            ),
          ],
        ));
  }
}
