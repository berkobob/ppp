import 'dart:convert';

import 'item.dart';

class Task extends Item {
  String due;
  String notes;
  bool hasNotes = false;

  Task(Map<String, dynamic> json)
      : super(source: Source.tasks, id: json['id'], title: json['title']) {
    due = json['due'];
    notes = json.containsKey('notes') ? json['notes'] : null;
    hasNotes = notes != null;
  }

  Task.insert({title});

  String toJson() => json.encode({'title': title});

  @override
  String toString() {
    if (hasNotes) return title + ':  ' + notes;
    return title;
  }
}
