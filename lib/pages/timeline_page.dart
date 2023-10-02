import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/models/event.dart';
import 'package:motor_diary/models/event_dao.dart';
import 'package:motor_diary/widgets/constant.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  // DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  final eventDao = EventDao();

  final _typeController = TextEditingController();
  final _odoController = TextEditingController();

  List<Event> eventList = [];

  bool updateEvent = false;

  // @override
  // void initState() {
  //   super.initState();
  //   retrieveEventData();
  // }

  @override
  void dispose() {
    _typeController.dispose();
    _odoController.dispose();
    super.dispose();
  }

  void _addEvent() {
    final event =
        Event(_typeController.text, _odoController.text, DateTime.now());
    eventDao.saveEvent(event);
    _typeController.clear();
    _odoController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          eventDialog();
        },
        child: const Icon(CupertinoIcons.gauge_badge_plus),
      ),
      body: _getEventList(),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Container(
      //         width: MediaQuery.of(context).size.width,
      //         height: MediaQuery.of(context).size.height * .2,
      //         decoration: BoxDecoration(
      //           color: primaryColor,
      //           borderRadius: const BorderRadius.only(
      //             bottomLeft: Radius.circular(20),
      //             bottomRight: Radius.circular(20),
      //           ),
      //         ),
      //         child: const Center(
      //           child: Text(
      //             'Event List',
      //             textAlign: TextAlign.center,
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontWeight: FontWeight.bold,
      //               fontSize: 24,
      //             ),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 16),
      //       // for (int i = eventList.length - 1; i >= 0; i--)
      //       //   eventWidget(eventList[i])

      //     ],
      //   ),
      // ),
    );
  }

  void eventDialog({String? key}) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _typeController,
                  decoration: const InputDecoration(
                    labelText: 'Type',
                    hintText: 'oil change | maintenance | refuel',
                    hintStyle: TextStyle(fontSize: 12),
                  ),
                ),
                TextField(
                  controller: _odoController,
                  decoration: const InputDecoration(labelText: 'Odometer'),
                  keyboardType: TextInputType.number,
                  maxLength: 5,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      _addEvent();
                      // Map<String, dynamic> data = {
                      //   'type': typeController.text,
                      //   'odo': odoController.text,
                      //   'date': date,
                      // };
                      //
                      // dbRef.push().set(data).then((value) {
                      Navigator.of(context).pop();
                      // });
                    },
                    child: const Text('Save'))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _getEventList() {
    return Expanded(
      child: FirebaseAnimatedList(
        query: eventDao.getEventQuery(),
        itemBuilder: (context, snapshot, animation, index) {
          final json = snapshot.value as Map<dynamic, dynamic>;
          final event = Event.fromJson(json);
          return eventWidget(event.type, event.odo, event.date);
        },
      ),
    );
  }

  // void retrieveEventData() {
  //   dbRef.onChildAdded.listen((data) {
  //     EventData eventData = EventData.fromJson(data.snapshot.value as Map);
  //     Event event = Event(key: data.snapshot.key, eventData: eventData);
  //     eventList.add(event);
  //     setState(() {});
  //   });
  // }

  // Widget eventWidget(Event event) {
  //   return InkWell(
  //     onTap: () {
  //       typeController.text = event.eventData!.type!;
  //       odoController.text = event.eventData!.odo!;
  //       updateEvent = true;
  //       eventDialog(key: event.key);
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       padding: const EdgeInsets.all(16),
  //       margin: const EdgeInsets.all(16),
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10),
  //           border: Border.all(color: Colors.black)),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: [
  //           Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 'Type: ${event.eventData!.type!}',
  //                 style: const TextStyle(fontSize: 16),
  //               ),
  //               Text(
  //                 'Odometer: ${event.eventData!.odo!}',
  //                 style: const TextStyle(fontSize: 16),
  //               ),
  //               Text(
  //                 'Date: $date',
  //                 style: const TextStyle(fontSize: 16),
  //               ),
  //             ],
  //           ),
  //           InkWell(
  //             onTap: () {
  //               dbRef.child(event.key!).remove().then((value) {
  //                 int index = eventList
  //                     .indexWhere((element) => element.key == event.key!);
  //                 eventList.removeAt(index);
  //                 setState(() {});
  //               });
  //             },
  //             child: const Icon(CupertinoIcons.delete, color: Colors.red),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget eventWidget(type, odo, date) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Type: $type',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Odometer: $odo',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Date: $date',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: const Icon(CupertinoIcons.delete, color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
