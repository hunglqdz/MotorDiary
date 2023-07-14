import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/constant.dart';
import 'package:motor_diary/setup/setup3.dart';

import 'setup_content.dart';

class Setup2 extends StatefulWidget {
  const Setup2({super.key});

  @override
  State<Setup2> createState() => _Setup2State();
}

class _Setup2State extends State<Setup2> {
  String dropdownValue = 'Customize';
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  TextEditingController textController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('SET UP'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          const SetupContent(
              image: 'assets/images/illustration.jpg',
              title: 'Step 2/3',
              description: "Configure your vehicle"),
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
              return DropdownMenuItem<String>(value: value, child: Text(value));
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
                labelText: 'Time for Maintenance (day)',
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
                labelText: 'Distance for Maintenance (km)',
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
                height: 60,
                width: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Setup3()));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: primaryColor),
                  child: const Icon(CupertinoIcons.arrow_right),
                )),
          ),
        ]),
      ),
    );
  }
}
