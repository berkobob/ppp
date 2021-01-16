import 'dart:developer' as d;

import 'package:ppp/models/item.dart';
import 'package:ppp/models/task_list.dart';
import 'package:ppp/services/dummy_google.dart';

import 'base.dart';

class Tasks extends Base {
  Google google = Google();
  TaskList captureList;
  TaskList myTasks;

  Future hasAccess() async {
    updateStatus(Service.busy);
    final lists = await google.getLists();
    if (lists == null || lists.length == 0) {
      updateStatus(Service.denied);
    } else {
      captureList = lists.firstWhere((list) => list.title == 'Capture');
      myTasks = lists.firstWhere((list) => list.title == 'My Tasks');
      updateStatus(Service.access);
    }
    await getItems();
  }

  Future getItems() async {
    if (status != Service.access) return;
    updateStatus(Service.busy);
    items = (await google.getTasks(taskList: captureList)).cast<Item>();
    updateStatus(Service.access);
  }

  Future<bool> add(Item item) async {
    updateStatus(Service.busy);
    d.log('Inserting $item into $myTasks');
    final result = await google.insertTask(taskList: myTasks, task: item);
    updateStatus(Service.access);
    return result;
  }

  Future<bool> delete(Item item) async {
    updateStatus(Service.busy);
    d.log('Deleting $item from $captureList in ${item.source}');
    final result = await google.deleteTask(list: myTasks, task: item);
    updateStatus(Service.access);
    return result;
  }
}
