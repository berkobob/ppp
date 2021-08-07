import 'item.dart';

class Task extends Item {
  final String? due;

  Task(Map<String, dynamic> json)
      : due = json['due'],
        super(
            source: Source.Google,
            id: json['id'],
            title: json['title'],
            notes: json['notes']);
}
