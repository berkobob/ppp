import 'package:ppp/models/item.dart';

import 'page.dart';

class OneNote extends Item {
  Page page;

  OneNote({title, this.page})
      : super(source: Source.onenotes, id: page.url, title: title, notes: null);
}
