import 'package:flutter/material.dart';
import 'package:motor_diary/constant.dart';
import 'package:motor_diary/pages/register_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.2,0.5,0.8,],
          colors: [accentColor,Colors.white,accentColor,],
        )
      ),
      child: Column(
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
      ),
    );
  }
}
