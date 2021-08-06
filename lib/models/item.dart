enum Source { Apple, Google, Microsoft, Other }

class Item {
  Source source;
  String id;
  String title;
  String? notes;

  Item(
      {required this.source,
      required this.id,
      required this.title,
      this.notes});

  Map<String, dynamic> toJson() => {
        'title': this.title,
        'notes': this.notes,
      };
}
