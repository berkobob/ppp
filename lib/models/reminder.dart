import 'item.dart';

class Reminder extends Item {
  int priority;
  bool isCompleted;
  String notes = "";
  String dueDate = "";
  String startDate = "";
  String completionDate = "";

  Reminder(id, title, this.priority, this.isCompleted,
      [this.notes = "", this.dueDate, this.startDate, this.completionDate])
      : super(source: Source.reminders, id: id, title: title);

  Reminder.fromJson(json)
      : super(source: Source.reminders, id: json['id'], title: json['title']) {
    this.priority = json['priority'];
    this.isCompleted = json['isCompleted'] as bool;
    this.notes = json['notes'];
    this.dueDate = json['dueDate'];
    this.startDate = json['startDate'];
    this.completionDate = json['completionDate'];
  }
}
