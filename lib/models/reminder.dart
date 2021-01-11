import 'item.dart';

class Reminder extends Item {
  int priority;
  bool isCompleted;
  String dueDate = "";
  String startDate = "";
  String completionDate = "";

  Reminder(id, title, this.priority, this.isCompleted,
      [this.dueDate, this.startDate, this.completionDate, notes])
      : super(source: Source.reminders, id: id, title: title, notes: notes);

  Reminder.fromJson(json)
      : super(
            source: Source.reminders,
            id: json['id'],
            title: json['title'],
            notes: json.containsKey('notes') ? json['notes'] : null) {
    this.priority = json['priority'];
    this.isCompleted = json['isCompleted'] as bool;
    this.notes = json['notes'];
    this.dueDate = json['dueDate'];
    this.startDate = json['startDate'];
    this.completionDate = json['completionDate'];
  }
}
