import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/my_button.dart';
import 'components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Flexible(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.smart_toy,
                size: 100,
              ),
              const SizedBox(height: 50),
              Text(
                'Register below with your details!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: emailController,
                hintText: 'email',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: passwordController,
                hintText: 'password',
                obscureText: true,
              ),
              const SizedBox(height: 25),
              MyButton(
                onTap: signUp,
                text: 'Sign Up',
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'I am a member!',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: const Text(
                      'Login now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
