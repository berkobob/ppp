class Section {
  String id;
  String displayName;
  String pagesUrl;

  Section(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['displayName'];
    pagesUrl = json['pagesUrl'];
  }

  @override
  String toString() {
    return displayName;
  }
}
