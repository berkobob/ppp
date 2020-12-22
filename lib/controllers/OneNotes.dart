import 'package:ppp/models/item.dart';

import 'base.dart';

class OneNotes extends Base {
  Future hasAccess() async {
    updateStatus(Service.busy);
    await Future.delayed(Duration(seconds: 2));
    getItems("");
    updateStatus(Service.access);
  }

  Future getItems([String list]) async {
    // if (status != Service.busy)
    updateStatus(Service.busy);
    items = [Item(source: Source.tasks, title: "I'm a OneNote", id: '321')];
    updateStatus(Service.idle);
  }
}
