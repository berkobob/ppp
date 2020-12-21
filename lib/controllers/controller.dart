import 'package:flutter/material.dart';
import 'package:ppp/models/item.dart';

import 'reminders.dart';
import 'tasks.dart';
import 'oneNotes.dart';

class Controller extends ChangeNotifier {
  List<Item> items = [];

  final sources = {
    "Reminders": Reminders(),
    "Taks": Tasks(),
    "OneNotes": OneNotes()
  };

  Controller() {
    sources.forEach((_, value) => value.notifyListeners = notifyListeners);
    sources.forEach((_, value) => value.hasAccess());
  }

  Future<List<Item>> getItems() async {
    return sources['Reminders'].items;
  }

  @override
  String toString() => '''Reminders: ${sources['reminders']}\n
      OneNotes: ${sources['oneNotes']}\n
      Tasks: ${sources['tasks']}''';
}
