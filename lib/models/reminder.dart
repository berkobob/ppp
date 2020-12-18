/// The Reminder class represents an ios Reminder
/// A reminder can be generated using a standard constructor or from JSON
class Reminder {
  String id;
  String title;
  int priority;
  bool isCompleted;
  String notes = "";
  String dueDate = "";
  String startDate = "";
  String completionDate = "";

  Reminder(this.id, this.title, this.priority, this.isCompleted,
      [this.notes = "", this.dueDate, this.startDate, this.completionDate]);

  Reminder.fromJson(json) {
    this.id = json['id'];
    this.title = json['title'];
    this.priority = json['priority'];
    this.isCompleted = json['isCompleted'] as bool;
    this.notes = json['notes'];
    this.dueDate = json['dueDate'];
    this.startDate = json['startDate'];
    this.completionDate = json['completionDate'];
  }

  @override
  String toString() {
    return this.title;
  }
}
