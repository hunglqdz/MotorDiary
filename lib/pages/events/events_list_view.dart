import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/services/cloud/cloud_event.dart';

import '../../utilities/dialogs/delete_dialog.dart';

typedef EventCallback = void Function(CloudEvent event);

class EventsListView extends StatelessWidget {
  final Iterable<CloudEvent> events;
  final EventCallback onDeleteEvent;
  final EventCallback onTap;

  const EventsListView({
    super.key,
    required this.events,
    required this.onDeleteEvent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events.elementAt(index);
        return ListTile(
          onTap: () {
            onTap(event);
          },
          title: Text(event.type),
          trailing: IconButton(
            onPressed: () async {
              final shouldDelete = await showDeleteDialog(context);
              if (shouldDelete) {
                onDeleteEvent(event);
              }
            },
            icon: const Icon(
              CupertinoIcons.delete,
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }
}
