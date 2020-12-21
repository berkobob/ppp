import 'package:flutter/material.dart';
import 'package:ppp/models/item.dart';

import 'reminders.dart';
import 'tasks.dart';
import 'oneNotes.dart';

class Controller extends ChangeNotifier {
  final sources = {
    "Reminders": Reminders(),
    "Taks": Tasks(),
    "OneNotes": OneNotes()
  };

  List<Item> _items = [];
  List<Item> get items {
    _items = [];
    sources.forEach((name, source) {
      if (source != null && source.items != null) _items += source.items;
    });
    return _items;
  }

  Controller() {
    sources.forEach((_, value) => value.notifyListeners = notifyListeners);
    sources.forEach((_, value) => value.hasAccess());
  }

  @override
  String toString() => '''Reminders: ${sources['reminders']}\n
      OneNotes: ${sources['oneNotes']}\n
      Tasks: ${sources['tasks']}''';
}
