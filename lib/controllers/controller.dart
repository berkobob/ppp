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

  refresh() {
    sources.forEach((_, source) {
      source.items = [];
      source.getItems();
    });
  }

  List<Item> get items {
    List<Item> _items = [];
    sources.forEach((_, source) {
      if (source != null && source.items != null) _items += source.items;
    });
    return _items;
  }

  add(Item item) async {
    d.log('Lets: ${item.title}', name: (this).toString());
    Tasks tasks = sources[Source.tasks];
    if (await tasks.add(item)) delete(item);
  }

  delete(Item item) {
    sources[item.source].delete(item);
    sources[item.source].items.remove(item);
  }

  bool remove(Item item) {
    d.log('Dismissing: ${item.title}', name: (this).toString());
    sources[item.source].items.remove(item);
    return true;
  }

  @override
  String toString() => 'Controller';
}
