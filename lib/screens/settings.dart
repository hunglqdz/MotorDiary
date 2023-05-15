import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../settings/vehicle.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    final myTextFieldValue = Provider.of<MyTextFieldValue>(context);

    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Card(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(10),
          color: Colors.green,
          child: ListTile(
            onTap: () {},
            title: Text(myTextFieldValue.text,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500)),
            trailing: const Icon(
              CupertinoIcons.pen,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text('GENERAL',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green)),
        ),
        Card(
          elevation: 4,
          margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(children: <Widget>[
            ListTile(
              leading: const Icon(Icons.motorcycle, color: Colors.green),
              title: const Text('Your Vehicles'),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VehicleSetting()));
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.gauge, color: Colors.green),
              title: const Text('Predictor Settings'),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {},
            ),
          ]),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text('NOTIFICATION',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green)),
        ),
        SwitchListTile(
          title: const Text('Enable Notification'),
          value: isEnabled,
          onChanged: (bool value) {
            setState(() {
              isEnabled = value;
            });
          },
          secondary: const Icon(CupertinoIcons.bell, color: Colors.green),
        )
      ],
    ));
  }
}
