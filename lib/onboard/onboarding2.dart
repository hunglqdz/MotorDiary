import 'package:flutter/material.dart';
import 'package:motor_diary/onboard/onboarding3.dart';

import '../screens/bottom_bar.dart';
import 'onboard_content.dart';

class OnBoarding2 extends StatefulWidget {
  const OnBoarding2({super.key});

  @override
  State<OnBoarding2> createState() => _OnBoarding2State();
}

class _OnBoarding2State extends State<OnBoarding2> {
  String dropdownValue = 'Vision';
  var items = ['Vision', 'Wave', 'Dream', 'AirBlade', 'Yamaha', 'Other...'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Setup'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(children: [
          const OnboardContent(
              image: 'assets/illustration.jpg',
              title: 'Step 2/3',
              description: "Configure your vehicle"),
          DropdownButton(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down),
            items: items.map((String items) {
              return DropdownMenuItem(value: items, child: Text(items));
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.oil_barrel),
                border: OutlineInputBorder(),
                labelText: 'Time for Oil change (day)',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.oil_barrel),
                border: OutlineInputBorder(),
                labelText: 'Distance for Oil change (km)',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.build),
                border: OutlineInputBorder(),
                labelText: 'Time for Management (day)',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.build),
                border: OutlineInputBorder(),
                labelText: 'Distance for Management (km)',
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    height: 60,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BottomBar()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple),
                      child: const Text('SKIP'),
                    )),
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
                                builder: (context) => const OnBoarding3()));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.purple),
                      child: const Icon(Icons.arrow_forward),
                    )),
              ),
            ],
          )
        ])));
  }
}
