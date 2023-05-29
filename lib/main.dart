import 'package:flutter/material.dart';
import 'package:motor_diary/widgets/bottom_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'welcome/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isSetupComplete = prefs.getBool('is_setup_complete') ?? false;

  runApp(ChangeNotifierProvider(
      create: (_) => MyTextFieldValue(),
      child: MyApp(isSetupComplete: isSetupComplete)));
}

class MyApp extends StatelessWidget {
  final bool isSetupComplete;
  const MyApp({super.key, required this.isSetupComplete});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motor Diary',
      theme: ThemeData(primarySwatch: Colors.green),
      home: isSetupComplete ? const BottomBar() : const WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyTextFieldValue extends ChangeNotifier {
  String _text = '';

  String get text => _text;

  void setText(String newText) {
    _text = newText;
    notifyListeners();
  }
}
