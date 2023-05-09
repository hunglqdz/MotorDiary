import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'welcome/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
      create: (_) => MyTextFieldValue(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motor Diary',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const WelcomePage(),
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
