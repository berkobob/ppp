import 'item.dart';

class Reminder extends Item {
  static final name = 'Reminders';
  int priority;
  bool isCompleted;
  String? dueDate = "";
  String? startDate = "";
  String? completionDate = "";

  Reminder(id, title, notes, this.priority, this.isCompleted,
      [this.dueDate, this.startDate, this.completionDate])
      : super(source: Source.Apple, id: id, title: title, notes: notes);

  Reminder.fromJson(json)
      : priority = json['priority'],
        this.isCompleted = json['isCompleted'] as bool,
        this.dueDate = json['dueDate'],
        this.startDate = json['startDate'],
        this.completionDate = json['completionDate'],
        super(
            source: Source.Apple,
            id: json['id'],
            title: json['title'],
            notes: json['notes'] ?? null);
}
