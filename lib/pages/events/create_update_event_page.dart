import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/constants/routes.dart';
import 'package:motor_diary/services/auth/auth_service.dart';
import 'package:motor_diary/services/cloud/cloud_event.dart';
import 'package:motor_diary/services/cloud/firebase_cloud_storage.dart';
import 'package:motor_diary/utilities/generics/get_arguments.dart';

class CreateUpdateEventPage extends StatefulWidget {
  const CreateUpdateEventPage({super.key});

  @override
  State<CreateUpdateEventPage> createState() => _CreateUpdateEventPageState();
}

class _CreateUpdateEventPageState extends State<CreateUpdateEventPage> {
  CloudEvent? _event;
  late final FirebaseCloudStorage _eventsService;
  late final TextEditingController _typeController;

  @override
  void initState() {
    _eventsService = FirebaseCloudStorage();
    _typeController = TextEditingController();
    super.initState();
  }

  void _typeControllerListener() async {
    final event = _event;
    if (event == null) {
      return;
    }
    final type = _typeController.text;
    await _eventsService.updateEvent(
      documentId: event.documentId,
      type: type,
    );
  }

  void _setupTypeControllerListener() {
    _typeController.removeListener(_typeControllerListener);
    _typeController.addListener(_typeControllerListener);
  }

  Future<CloudEvent> createOrGetExistingEvent(BuildContext context) async {
    final widgetEvent = context.getArgument<CloudEvent>();

    if (widgetEvent != null) {
      _event = widgetEvent;
      _typeController.text = widgetEvent.type;
      return widgetEvent;
    }

    final existingEvent = _event;
    if (existingEvent != null) {
      return existingEvent;
    }
    final currentUser = AuthService.firebase().currentUser!;
    final userId = currentUser.id;
    final newEvent = await _eventsService.createNewEvent(ownerUserId: userId);
    _event = newEvent;
    return newEvent;
  }

  void _deleteEventIfEmpty() {
    final event = _event;
    if (_typeController.text.isEmpty && event != null) {
      _eventsService.deleteEvent(documentId: event.documentId);
    }
  }

  void _saveEventIfNotEmpty() async {
    final event = _event;
    final type = _typeController.text;
    if (event != null && type.isNotEmpty) {
      await _eventsService.updateEvent(
        documentId: event.documentId,
        type: type,
      );
    }
  }

  @override
  void dispose() {
    _deleteEventIfEmpty();
    _saveEventIfNotEmpty();
    _typeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Event'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(createOrUpdateEventRoute);
        },
        child: const Icon(CupertinoIcons.add),
      ),
      body: FutureBuilder(
        future: createOrGetExistingEvent(context),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              _setupTypeControllerListener();
              return TextField(
                controller: _typeController,
              );
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
