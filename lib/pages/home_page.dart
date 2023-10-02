import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/widgets/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = FirebaseAuth.instance.currentUser;

  DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  String lastDate = '';
  String lastOdo = '';

  // @override
  // void initState() {
  //   super.initState();
  //   getLastDate();
  //   getLastOdo();
  // }

  Future<Object?> getLastData() async {
    DataSnapshot snapshot = (await dbRef.limitToLast(1).once()) as DataSnapshot;
    if (snapshot.value != null) {
      final Object? data = snapshot.value;
      return data;
    } else {
      return null;
    }
  }

  getLastOdo() {
    dbRef.orderByKey().limitToLast(1).onValue.listen((event) {
      final data = event.snapshot.value;
      setState(() {
        lastOdo = data.toString();
      });
    });
  }
  //
  // getLastOdo() {
  //   dbRef.orderByKey().limitToLast(1).onValue.listen((event) {
  //     final data = (event.snapshot.value as Map)['odo'];
  //     setState(() {
  //       lastOdo = data.toString();
  //     });
  //   });
  // }

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
                      child: StreamBuilder(
                        stream: dbRef.child('date').onValue,
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData &&
                              snapshot.data!.snapshot.value != null) {
                            String date = snapshot.data!.snapshot.value;
                            if (date != null) {
                              return Text('Date: $date');
                            } else {
                              return const Text('No data');
                            }
                          } else {
                            return const Text('Loading...');
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: StreamBuilder(
                        stream: dbRef.child('odo').onValue,
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData &&
                              snapshot.data!.snapshot.value != null) {
                            String odo = snapshot.data!.snapshot.value;
                            if (odo != null) {
                              return Text('Odo: $odo');
                            } else {
                              return const Text('No data');
                            }
                          } else {
                            return const Text('Loading...');
                          }
                        },
                      ),
                    )
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
