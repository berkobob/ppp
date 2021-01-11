enum Source { reminders, tasks, onenotes, block }

class Item {
  Source source;
  String id;
  String title;
  String notes;
  bool hasNotes;

  Item({this.source, this.id, this.title, this.notes}) {
    hasNotes = this.notes != null;
  }

  @override
  String toString() {
    return '$source: ${this.title}';
  }
}
