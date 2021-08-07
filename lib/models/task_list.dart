class TaskList {
  String id;
  String title;
  String selfLink;

  TaskList(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'],
        selfLink = json['selfLink'];

  @override
  String toString() {
    return title;
  }
}
