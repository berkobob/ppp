import 'package:flutter/material.dart';
import 'package:ppp/models/item.dart';

import 'reminders.dart';
import 'tasks.dart';
import 'oneNotes.dart';

class Controller extends ChangeNotifier {
  final sources = {
    "Reminders": Reminders(),
    "Tasks": Tasks(),
    "OneNotes": OneNotes()
  };

  List<Item> blocks = [];

  List<Item> _items = [];
  List<Item> get items {
    _items = [];
    sources.forEach((_, source) {
      if (source != null && source.items != null) _items += source.items;
    });
    _items += blocks;
    return _items;
  }

  void add(Item item) {
    blocks.add(item);
    notifyListeners();
  }

  Future refresh() async {
    print('The refresh function in the controller has been called');
    sources.forEach((key, source) async => await source.getItems(""));
  }

  Controller() {
    sources.forEach((_, source) => source.notifyListeners = notifyListeners);
    sources.forEach((_, source) => source.hasAccess());
  }

  @override
  String toString() => '''Reminders: ${sources['reminders']}\n
      OneNotes: ${sources['oneNotes']}\n
      Tasks: ${sources['tasks']}''';
}
