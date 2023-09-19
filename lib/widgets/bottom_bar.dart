import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/pages/settings_page.dart';
import 'package:motor_diary/widgets/constant.dart';

import '../camera/camera_screen.dart';
import '../pages/graph_page.dart';
import '../pages/home_page.dart';
import '../pages/timeline_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentTab = 0;
  final List<Widget> screens = [
    const HomePage(),
    const TimelinePage(),
    const GraphPage(),
    const SettingsPage()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: primaryColor,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const CameraScreen(),
            ),
          );
        },
        child: const Icon(
          CupertinoIcons.camera,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(
                        () {
                          currentScreen = const HomePage();
                          currentTab = 0;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.home,
                            color:
                                currentTab == 0 ? primaryColor : Colors.black),
                        Text(
                          'Home',
                          style: TextStyle(
                              color: currentTab == 0
                                  ? primaryColor
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(
                        () {
                          currentScreen = const TimelinePage();
                          currentTab = 1;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.calendar,
                            color:
                                currentTab == 1 ? primaryColor : Colors.black),
                        Text(
                          'Timeline',
                          style: TextStyle(
                              color: currentTab == 1
                                  ? primaryColor
                                  : Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(
                        () {
                          currentScreen = const GraphPage();
                          currentTab = 2;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.chart_bar,
                            color:
                                currentTab == 2 ? primaryColor : Colors.black),
                        Text(
                          'Graph',
                          style: TextStyle(
                              color: currentTab == 2
                                  ? primaryColor
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(
                        () {
                          currentScreen = const SettingsPage();
                          currentTab = 3;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.gear,
                            color:
                                currentTab == 3 ? primaryColor : Colors.black),
                        Text(
                          'Settings',
                          style: TextStyle(
                              color: currentTab == 3
                                  ? primaryColor
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
