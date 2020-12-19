import 'package:flutter/material.dart';
import 'package:ppp/models/reminder.dart';

import 'reminders.dart';
import 'tasks.dart';
import 'oneNotes.dart';

class Controller extends ChangeNotifier {
  List<dynamic> items = [];

  final sources = {
    "Reminders": Reminders(),
    "Taks": Tasks(),
    "OneNotes": OneNotes()
  };

  Controller() {
    sources.forEach((_, value) => value.notifyListeners = notifyListeners);
    sources.forEach((_, value) => value.hasAccess());
  }

  Future<List<Reminder>> getItems() async {
    return await sources['Reminders'].getItems("");
  }

  // @override
  // String toString() =>
  //     "Reminders: ${reminders.status}\nOneNotes: ${oneNotes.status}\nTasks: ${tasks.status}";
}
