import 'package:ppp/models/item.dart';
import 'package:ppp/models/task.dart';
import 'package:ppp/models/task_list.dart';

class Google {
  Future<List<TaskList>> getLists() async {
    final list1 = {"id": '1', "title": 'My Tasks', 'selfLink': null};
    final list2 = {"id": '1', "title": 'Capture', 'selfLink': null};
    return Future.value([TaskList(list1), TaskList(list2)]);
  }

  Future<List<dynamic>> getTasks({TaskList taskList}) async {
    final task1 = Task({
      'id': '2',
      'title': 'This is the first task',
      'due': null,
      'notes': null,
    });

    final task2 = Task({
      'id': '3',
      'title': 'This is also a task',
      'due': null,
      'notes': null,
    });

    return Future.delayed(Duration(seconds: 1), () => [task1, task2]);
  }

  Future<bool> insertTask({TaskList taskList, Item task}) async {
    return Future.delayed(Duration(microseconds: 30), () => true);
  }

  Future<bool> deleteTask({TaskList list, Item task}) async {
    return Future.delayed(Duration(microseconds: 30), () => true);
  }
}
