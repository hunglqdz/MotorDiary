import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/pages/settings_page.dart';

import '../pages/home_page.dart';
import '../pages/timeline_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentTab = 0;
  final List<Widget> pages = [
    const HomePage(),
    const TimelinePage(),
    const SettingsPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
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
                    Icon(
                        currentTab == 0
                            ? CupertinoIcons.house_fill
                            : CupertinoIcons.house,
                        color: currentTab == 0 ? Colors.green : Colors.black),
                    Text(
                      'Home',
                      style: TextStyle(
                          color: currentTab == 0 ? Colors.green : Colors.black),
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
                    Icon(
                        currentTab == 1
                            ? CupertinoIcons.list_dash
                            : CupertinoIcons.list_bullet,
                        color: currentTab == 1 ? Colors.green : Colors.black),
                    Text(
                      'Timeline',
                      style: TextStyle(
                          color: currentTab == 1 ? Colors.green : Colors.black),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(
                    () {
                      currentScreen = const SettingsPage();
                      currentTab = 2;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                        currentTab == 2
                            ? CupertinoIcons.gear_alt_fill
                            : CupertinoIcons.gear_alt,
                        color: currentTab == 2 ? Colors.green : Colors.black),
                    Text(
                      'Settings',
                      style: TextStyle(
                          color: currentTab == 2 ? Colors.green : Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
