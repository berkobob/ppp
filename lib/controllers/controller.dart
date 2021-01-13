import 'dart:developer' as d;

import 'package:flutter/material.dart';
import 'package:ppp/models/item.dart';

import 'reminders.dart';
import 'tasks.dart';
import 'oneNotes.dart';

class Controller extends ChangeNotifier {
  final sources = {
    Source.reminders: Reminders(),
    Source.tasks: Tasks(),
    Source.onenotes: OneNotes()
  };

  Controller() {
    sources.forEach((_, source) => source.notifyListeners = notifyListeners);
    sources.forEach((_, source) => source.hasAccess());
  }

  List<Item> get items {
    List<Item> _items = [];
    sources.forEach((_, source) {
      if (source != null && source.items != null) _items += source.items;
    });
    return _items;
  }

  Future<bool> add(Item item) async {
    d.log('Lets: ${item.title}', name: (this).toString());
    Tasks tasks = sources[Source.tasks];
    if (await tasks.add(item)) {
      sources[item.source].delete(item);
      sources[item.source].items.remove(item);
    } else
      return false;
    return true;
  }

  Future<bool> remove(Item item) {
    d.log('Dismissing: ${item.title}', name: (this).toString());
    sources[item.source].items.remove(item);
    return Future.value(true);
  }

  @override
  String toString() => 'Controller';
}
