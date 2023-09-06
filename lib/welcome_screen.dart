import 'package:flutter/material.dart';
import 'package:motor_diary/pages/register_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Motor Diary',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Icon(Icons.motorcycle,size: 100,),
        ElevatedButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegisterPage(showLoginPage: )));
        }, child:const Text('Get started'),),
      ],
    );
  }
}
