class Section {
  String id;
  String displayName;
  String pagesUrl;
  String notebook;

  Section(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['displayName'];
    pagesUrl = json['pagesUrl'];
    notebook = json['parentNotebook']['displayName'];
  }

  @override
  String toString() {
    return '$notebook in $displayName';
  }
}
