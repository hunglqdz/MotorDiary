import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widget.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? indicator(true) : indicator(false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: getDecoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 650,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      getField('', 'assets/images/onboard1.png',
                          'Welcome to MotorDiary!'),
                      getField(
                          'Manage your vehicle',
                          'assets/images/onboard2.png',
                          'Predict important events by capturing images!'),
                      getField('Expand lifespan', 'assets/images/onboard3.jpg',
                          'Keep your vehicle healthy!'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage == _numPages - 1
                    ? Expanded(
                        child: Align(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    'Skip',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ),
                                ),
                                getButton(_pageController),
                              ],
                            ),
                          ),
                        ),
                      )
                    : const Text(''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
