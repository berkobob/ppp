import 'dart:convert';

class Task {
  String id;
  String title;
  String due;
  String notes;
  bool hasNotes = false;

  Task(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    due = json['due'];
    notes = json.containsKey('notes') ? json['notes'] : null;
    hasNotes = notes != null;
  }

  Task.insert({this.title});

  String toJson() => json.encode({'title': title});

  @override
  String toString() {
    if (hasNotes) return title + ':  ' + notes;
    return title;
  }
}
