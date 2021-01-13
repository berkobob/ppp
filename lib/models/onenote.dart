import 'package:ppp/models/item.dart';

class OneNote extends Item {
  String url;
  String html;

  OneNote({title, id, this.url, this.html})
      : super(source: Source.onenotes, id: id, title: title, notes: null);
}
