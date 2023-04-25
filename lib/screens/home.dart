import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .2,
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: const Center(
                child: Text(
                  'Welcome back, master',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text('Last Record'),
                  Container(color: Colors.green)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
