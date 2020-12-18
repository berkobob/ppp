import 'package:flutter/material.dart';

import 'reminders.dart';
import 'tasks.dart';
import 'oneNotes.dart';

class Controller extends ChangeNotifier {
  List<dynamic> items = [];

  Reminders reminders = Reminders();
  OneNotes oneNotes = OneNotes();
  Tasks tasks = Tasks();

  Controller() {
    reminders.notifyListeners = notifyListeners;
    tasks.notifyListeners = notifyListeners;
    oneNotes.notifyListeners = notifyListeners;

    reminders.hasAccess();
    tasks.hasAccess();
    oneNotes.hasAccess();
  }

  @override
  String toString() =>
      "Reminders: ${reminders.status}\nOneNotes: ${oneNotes.status}\nTasks: ${tasks.status}";
}
