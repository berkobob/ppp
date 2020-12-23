class Page {
  String id;
  String title;
  String url;

  Page(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['contentUrl'];
  }

  @override
  String toString() {
    return title;
  }
}
