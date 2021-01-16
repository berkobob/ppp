import 'package:ppp/models/item.dart';
import 'package:ppp/models/onenote.dart';
import 'package:ppp/models/page.dart';
import 'package:ppp/models/section.dart';

class Microsoft {
  Future<String> isConnected() async {
    return Future.delayed(Duration(seconds: 3), () => 'Hi');
  }

  Future<bool> done(Item item) async {
    return Future.delayed(Duration(seconds: 1), () => true);
  }

  Future<List> getSections() async {
    return Future.value([
      Section({
        'id': 'Section1',
        'displayName': 'Unfiled Notes',
        'pagesUrl': 'pagesUrl'
      })
    ]);
  }

  Future<List> getPages(Section section) async {
    return Future.value([
      Page({'id': 'Page 1', 'title': 'ANTOINE', 'contentUrl': "contentUrl"})
    ]);
  }

  Future<List> getContent(Page page) async {
    List<OneNote> items = [];
    items.add(OneNote(title: 'Develop trade log PLEASE', id: 'id'));
    items.add(OneNote(title: 'this is the second note', id: 'id'));
    items.add(OneNote(title: 'Try a bv app', id: 'id'));
    items.add(OneNote(title: 'The penultimate note', id: 'id'));
    items.add(OneNote(title: 'Here lies the final note', id: 'id'));
    return Future.delayed(Duration(seconds: 2), () => items);
  }
}
