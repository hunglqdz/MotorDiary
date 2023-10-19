import 'package:flutter/material.dart';
import 'package:motor_diary/constants/routes.dart';
import 'package:motor_diary/pages/events/events_list_view.dart';
import 'package:motor_diary/services/cloud/cloud_event.dart';
import 'package:motor_diary/services/cloud/firebase_cloud_storage.dart';

import '../services/auth/auth_service.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  late final FirebaseCloudStorage _eventsService;
  String get userId => AuthService.firebase().currentUser!.id;

  @override
  void initState() {
    _eventsService = FirebaseCloudStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Events'),
        ),
        body: StreamBuilder(
          stream: _eventsService.allEvents(ownerUserId: userId),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.active:
                if (snapshot.hasData) {
                  final allEvents = snapshot.data as Iterable<CloudEvent>;
                  return EventsListView(
                    events: allEvents,
                    onDeleteEvent: (event) async {
                      await _eventsService.deleteEvent(
                          documentId: event.documentId);
                    },
                    onTap: (event) {
                      Navigator.of(context).pushNamed(
                        createOrUpdateEventRoute,
                        arguments: event,
                      );
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }

              default:
                return const CircularProgressIndicator();
            }
          },
        ));
  }
}
