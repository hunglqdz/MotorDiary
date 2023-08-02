import 'package:flutter/material.dart';

import '../bottom_bar.dart';
import '../constant.dart';
import '../service/database_helper.dart';
import 'event_model.dart';

class EventScreen extends StatelessWidget {
  final Event? event;
  const EventScreen({super.key, this.event});

  @override
  Widget build(BuildContext context) {
    final odoController = TextEditingController();

    if (event != null) {
      odoController.text = event!.odometer;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(event == null ? 'Add an event' : 'Edit event'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Center(
                child: Text(
                  'What is the odometer now?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TextFormField(
              controller: odoController,
              decoration: const InputDecoration(
                  hintText: 'Ex: 12345',
                  labelText: 'Odometer',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
              keyboardType: TextInputType.number,
              onChanged: (str) {},
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 70,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () async {
                      final odo = odoController.value.text;
                      if (odo.isEmpty) {
                        return;
                      }
                      final Event model = Event(
                        id: event?.id,
                        odometer: odo,
                        type: 'Oil Change',
                        color: oilChangeColor,
                      );
                      if (event == null) {
                        await DatabaseHelper.addEvent(model);
                      } else {
                        await DatabaseHelper.updateEvent(model);
                      }
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomBar()));
                    },
                    child: const Text('Oil Change'),
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () async {
                      final odo = odoController.value.text;
                      if (odo.isEmpty) {
                        return;
                      }
                      final Event model = Event(
                        id: event?.id,
                        odometer: odo,
                        type: 'Maintenance',
                        color: maintenanceColor,
                      );
                      if (event == null) {
                        await DatabaseHelper.addEvent(model);
                      } else {
                        await DatabaseHelper.updateEvent(model);
                      }
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomBar()));
                    },
                    child: const Text('Maintenance'),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 70,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () async {
                      final odo = odoController.value.text;
                      if (odo.isEmpty) {
                        return;
                      }
                      final Event model = Event(
                          odometer: odo,
                          id: event?.id,
                          type: '',
                          color: Colors.grey);
                      if (event == null) {
                        await DatabaseHelper.addEvent(model);
                      } else {
                        await DatabaseHelper.updateEvent(model);
                      }
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomBar()));
                    },
                    child: const Text('Update'),
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomBar()));
                    },
                    child: const Text('Discard'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
