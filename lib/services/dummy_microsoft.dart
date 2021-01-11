import 'package:ppp/models/onenote.dart';
import 'package:ppp/models/page.dart';
import 'package:ppp/models/section.dart';

class Microsoft {
  Future<String> isConnected() async {
    return Future.delayed(Duration(seconds: 3), () => 'Hi');
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
    items.add(OneNote(title: 'Develop trade log PLEASE', page: page));
    items.add(OneNote(title: 'this is the second note', page: page));
    items.add(OneNote(title: 'Try a bv app', page: page));
    items.add(OneNote(title: 'The penultimate note', page: page));
    items.add(OneNote(title: 'Here lies the final note', page: page));
    return Future.delayed(Duration(seconds: 2), () => items);
  }
}
