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
      this.notes}) {
    if (notes?.trim() == '') notes = null;
  }

  Map<String, dynamic> toJson() => notes?.trim() == null
      ? {'title': this.title}
      : {
          'title': this.title,
          'notes': this.notes,
        };
}
