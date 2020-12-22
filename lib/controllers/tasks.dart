import 'package:ppp/models/item.dart';
import 'package:ppp/models/task_list.dart';
import 'package:ppp/services/google.dart';

import 'base.dart';

class Tasks extends Base {
  Google google = Google();
  TaskList list;

  Future hasAccess() async {
    updateStatus(Service.busy);
    final lists = await google.getLists();
    if (lists == null || lists.length == 0) {
      updateStatus(Service.denied);
    } else {
      list = lists.firstWhere((list) => list.title == 'My Tasks');
      updateStatus(Service.access);
    }
    await getItems();
  }

  Future getItems([String l]) async {
    if (status != Service.access) return;
    updateStatus(Service.busy);
    items = (await google.getTasks(taskList: list)).cast<Item>();
    updateStatus(Service.idle);
  }
}
