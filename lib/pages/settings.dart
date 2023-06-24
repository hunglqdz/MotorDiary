import 'package:flutter/material.dart';
import 'package:motor_diary/constant.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int? numOfRecords = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 5, color: primaryColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text(
                        'Number of records for predictor',
                        style: TextStyle(fontSize: 18),
                      ),
                      const Divider(),
                      Row(
                        children: <Widget>[
                          Flexible(
                            fit: FlexFit.loose,
                            child: RadioListTile(
                              title: const Text('5'),
                              value: 5,
                              groupValue: numOfRecords,
                              onChanged: (value) {
                                setState(() {
                                  numOfRecords = value;
                                });
                              },
                            ),
                          ),
                          const VerticalDivider(),
                          Flexible(
                            fit: FlexFit.loose,
                            child: RadioListTile(
                              title: const Text('10'),
                              value: 10,
                              groupValue: numOfRecords,
                              onChanged: (value) {
                                setState(() {
                                  numOfRecords = value;
                                });
                              },
                            ),
                          ),
                          const VerticalDivider(),
                          Flexible(
                            fit: FlexFit.loose,
                            child: RadioListTile(
                              title: const Text('15'),
                              value: 15,
                              groupValue: numOfRecords,
                              onChanged: (value) {
                                setState(
                                  () {
                                    numOfRecords = value;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
