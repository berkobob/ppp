import 'package:ppp/models/item.dart';

import 'base.dart';

class Tasks extends Base {
  Future hasAccess() async {
    updateStatus(Service.busy);
    await Future.delayed(Duration(seconds: 5));
    items = [Item(source: Source.tasks, title: "I'm a reminder", id: '123')];
    updateStatus(Service.access);
  }

  Future<List<Item>> getItems(String list) async {
    return null;
  }
}
