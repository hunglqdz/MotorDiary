import 'package:flutter/material.dart';
import 'package:motor_diary/pages/register_page.dart';

class WelcomeScreen extends StatefulWidget {
  static const route = '/welcome-screen';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<Widget> _pages = [
    Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/images/1.png',
              fit: BoxFit.cover,
            ),
          ),
          const Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  'Motor Diary',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Welcome user!',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/images/2.png',
              fit: BoxFit.cover,
            ),
          ),
          const Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  'Manage your vehicle',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Just capture the odometer!',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/images/3.png',
              fit: BoxFit.cover,
            ),
          ),
          const Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  'Stay up-to-date',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Never miss important events!',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return _pages[index];
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIndicator(0),
                  _buildIndicator(1),
                  _buildIndicator(2),
                ],
              ),
            ),
          ),
          Visibility(
            visible: _currentPage == _pages.length - 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  },
                  child: const Text('Get Started'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(int index) {
    return Container(
      width: 20,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        shape: BoxShape.rectangle,
        color: _currentPage == index ? Colors.green : Colors.grey,
      ),
    );
  }
}
