import 'package:ppp/models/item.dart';

import 'base.dart';

class OneNotes extends Base {
  Future hasAccess() async {
    updateStatus(Service.busy);
    await Future.delayed(Duration(seconds: 2));
    items = [Item(source: Source.tasks, title: "I'm a OneNote", id: '321')];
    updateStatus(Service.access);
  }

  Future<List<Item>> getItems(String list) async {
    return null;
  }
}
