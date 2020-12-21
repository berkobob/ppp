import 'package:ppp/models/item.dart';

import 'base.dart';

class Tasks extends Base {
  Future hasAccess() async {
    updateStatus(ServiceStatus.busy);
    await Future.delayed(Duration(seconds: 5));
    items = [Item(source: Source.tasks, title: "I'm a reminder", id: '123')];
    updateStatus(ServiceStatus.access);
  }

  Future<List<dynamic>> getItems(String list) async {
    return null;
  }
}
