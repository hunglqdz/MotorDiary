import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/components/my_button.dart';
import 'package:motor_diary/components/my_textfield.dart';

import 'forgot_pw_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Email'),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Password'),
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Welcome user!',
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
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ForgotPasswordPage();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  MyButton(
                    onTap: signUserIn,
                  ),
                  const SizedBox(height: 50),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: Divider(
                  //           thickness: 0.5,
                  //           color: Colors.grey[400],
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 10),
                  //         child: Text(
                  //           'Or continue with',
                  //           style: TextStyle(color: Colors.grey[700]),
                  //         ),
                  //       ),
                  //       Expanded(
                  //         child: Divider(
                  //           thickness: 0.5,
                  //           color: Colors.grey[400],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(height: 50),
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SquareTile(imagePath: 'assets/images/google.png'),
                  //     SizedBox(width: 25),
                  //     SquareTile(imagePath: 'assets/images/facebook.png'),
                  //   ],
                  // ),
                  // const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Register now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
