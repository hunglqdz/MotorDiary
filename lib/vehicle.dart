import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class VehicleSetting extends StatefulWidget {
  const VehicleSetting({super.key});

  @override
  State<VehicleSetting> createState() => _VehicleSettingState();
}

class _VehicleSettingState extends State<VehicleSetting> {
  String dropdownValue = 'Customize';
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  TextEditingController textController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final myTextFieldValue = Provider.of<MyTextFieldValue>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Column(
          children: [
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(CupertinoIcons.arrowtriangle_down_circle),
              items: <String>[
                'Vision',
                'Wave',
                'Dream',
                'AirBlade',
                'Yamaha',
                'Customize'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  if (dropdownValue == 'Vision') {
                    textController1.text = '100';
                    textController2.text = '1000';
                    textController3.text = '100';
                    textController4.text = '1000';
                  } else if (dropdownValue == 'Wave') {
                    textController1.text = '200';
                    textController2.text = '2000';
                    textController3.text = '200';
                    textController4.text = '2000';
                  } else if (dropdownValue == 'Dream') {
                    textController1.text = '300';
                    textController2.text = '3000';
                    textController3.text = '300';
                    textController4.text = '3000';
                  } else if (dropdownValue == 'AirBlade') {
                    textController1.text = '400';
                    textController2.text = '4000';
                    textController3.text = '400';
                    textController4.text = '4000';
                  } else if (dropdownValue == 'Yamaha') {
                    textController1.text = '500';
                    textController2.text = '5000';
                    textController3.text = '500';
                    textController4.text = '5000';
                  } else if (dropdownValue == 'Customize') {
                    textController1.text = '';
                    textController2.text = '';
                    textController3.text = '';
                    textController4.text = '';
                  }
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: textController1,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  suffixIcon: Icon(CupertinoIcons.drop),
                  border: OutlineInputBorder(),
                  labelText: 'Time for Oil change (day)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: textController2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  suffixIcon: Icon(CupertinoIcons.drop),
                  border: OutlineInputBorder(),
                  labelText: 'Distance for Oil change (km)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: textController3,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  suffixIcon: Icon(CupertinoIcons.wrench),
                  border: OutlineInputBorder(),
                  labelText: 'Time for Management (day)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: textController4,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  suffixIcon: Icon(CupertinoIcons.wrench),
                  border: OutlineInputBorder(),
                  labelText: 'Distance for Management (km)',
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  height: 60,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text('DONE'),
                  )),
            ),
          ],
        )));
  }
}
