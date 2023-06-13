import 'package:flutter/material.dart';

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
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Number of records for predictor',
              style: TextStyle(fontSize: 18),
            ),
            const Divider(),
            Row(
              children: [
                RadioListTile(
                  title: const Text('5'),
                  value: 5,
                  groupValue: numOfRecords,
                  onChanged: (value) {
                    setState(() {
                      numOfRecords = value;
                    });
                  },
                ),
                const VerticalDivider(),
                RadioListTile(
                  title: const Text('10'),
                  value: 10,
                  groupValue: numOfRecords,
                  onChanged: (value) {
                    setState(() {
                      numOfRecords = value;
                    });
                  },
                ),
                const VerticalDivider(),
                RadioListTile(
                  title: const Text('15'),
                  value: 15,
                  groupValue: numOfRecords,
                  onChanged: (value) {
                    setState(() {
                      numOfRecords = value;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
