enum Source { reminders, tasks, onenotes, block }

class Item {
  Source source;
  String id;
  String title;

  Item({this.source, this.id, this.title});

  @override
  String toString() {
    return '$source: ${this.title}';
  }
}
