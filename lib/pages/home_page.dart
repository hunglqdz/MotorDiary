import 'package:flutter/material.dart';
import 'package:odometer/odometer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
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
                    const Text(
                      'Welcome, user',
                      style: TextStyle(
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
                  border: Border.all(width: 2),
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
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Date: ',
                        style: TextStyle(fontSize: 16),
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
                                odometerNumber: OdometerNumber(12345),
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
                  border: Border.all(width: 2),
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
