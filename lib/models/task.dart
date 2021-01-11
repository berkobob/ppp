import 'dart:convert';

import 'item.dart';

class Task extends Item {
  String due;

  Task(Map<String, dynamic> json)
      : super(
            source: Source.tasks,
            id: json['id'],
            title: json['title'],
            notes: json.containsKey('notes') ? json['notes'] : null) {
    due = json['due'];
  }

  Task.insert({title});

  String toJson() => json.encode({'title': title});

  @override
  String toString() {
    if (hasNotes) return title + ':  ' + notes;
    return title;
  }
}
