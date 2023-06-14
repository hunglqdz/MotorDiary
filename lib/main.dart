import 'package:flutter/material.dart';
import 'bottom_bar.dart';
import 'onboard/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen $initScreen');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motor Diary',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Onboarding(),
      debugShowCheckedModeBanner: false,
      initialRoute: initScreen == 0 || initScreen == null ? 'first' : '/',
      routes: {
        '/': (context) => const BottomBar(),
        'first': (context) => const Onboarding(),
      },
    );
  }
}
