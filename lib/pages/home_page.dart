import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/widgets/constant.dart';
import 'package:odometer/odometer.dart';

import '../models/event.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = FirebaseAuth.instance.currentUser;

  DatabaseReference dbRef = FirebaseDatabase.instance.ref('Events');

  String date = '';
  String odo = '';

  @override
  void initState() {
    super.initState();
    retrieveEventData();
  }

  void retrieveEventData() {
    dbRef.onChildAdded.listen((data) {
      EventData eventData = EventData.fromJson(data.snapshot.value as Map);
      Event event = Event(key: data.snapshot.key, eventData: eventData);
      setState(() {
        date = event.eventData!.date!;
        odo = event.eventData!.odo!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .2,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/icon/icon.png',
                        width: 100, height: 100),
                    Text(
                      'Welcome, ${user!.displayName}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 46),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 20),
                      child: Text(
                        'Last Record',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Date: $date',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const Text(
                            'Odometer:',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 20),
                          Stack(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    color: Colors.black,
                                    width: 17,
                                    height: 25,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    width: 2,
                                    height: 25,
                                  ),
                                  Container(
                                    color: Colors.black,
                                    width: 17,
                                    height: 25,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    width: 2,
                                    height: 25,
                                  ),
                                  Container(
                                    color: Colors.black,
                                    width: 17,
                                    height: 25,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    width: 2,
                                    height: 25,
                                  ),
                                  Container(
                                    color: Colors.black,
                                    width: 17,
                                    height: 25,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    width: 2,
                                    height: 25,
                                  ),
                                  Container(
                                    color: Colors.black,
                                    width: 17,
                                    height: 25,
                                  ),
                                ],
                              ),
                              AnimatedSlideOdometerNumber(
                                numberTextStyle: const TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Digital-7',
                                  color: Colors.white,
                                ),
                                odometerNumber: OdometerNumber(int.parse(odo)),
                                duration: Duration.zero,
                                letterWidth: 20,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 20),
                      child: Text(
                        'Estimated',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Date: ???'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Odo: ???'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
