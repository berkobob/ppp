import 'dart:convert';

enum Source { reminders, tasks, onenotes, block }

class Item {
  Source source;
  String id;
  String title;
  String notes;
  bool hasNotes;

  Item({this.source, this.id, this.title, this.notes}) {
    hasNotes = notes != null && notes != '';
  }

  String toJson() =>
      json.encode({'title': title, 'notes': hasNotes ? notes : ""});

  @override
  String toString() {
    return '$source\t$id\t$title\t$hasNotes\t$notes';
  }
}
