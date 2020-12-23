class Notebook {
  String id;
  String displayName;
  String sectionsUrl;

  Notebook(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['displayName'];
    sectionsUrl = json['sectionsUrl'];
  }

  @override
  String toString() {
    return displayName;
  }
}
