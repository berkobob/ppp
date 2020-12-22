import 'package:ppp/models/item.dart';
import 'package:ppp/services/google.dart';

import 'base.dart';

class Tasks extends Base {
  Google google = Google();

  Future hasAccess() async {
    updateStatus(Service.busy);
    await getItems();
    updateStatus(items.isEmpty ? Service.denied : Service.access);
  }

  Future getItems([String list]) async {
    updateStatus(Service.busy);
    final lists = await google.getLists();
    if (lists != null) {
      final list = lists.firstWhere((list) => list.title == 'My Tasks');
      items = (await google.getTasks(taskList: list)).cast<Item>();
    }
    updateStatus(Service.idle);
  }
}
