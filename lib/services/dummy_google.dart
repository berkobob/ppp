import 'package:ppp/models/task.dart';
import 'package:ppp/models/task_list.dart';

class Google {
  Future<List<TaskList>> getLists() async {
    final list = {"id": '1', "title": 'My Tasks', 'selfLink': null};
    return Future.value([TaskList(list)]);
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

    // return Future<List>.value([task1, task2]);
    return Future.delayed(Duration(seconds: 1), () => [task1, task2]);
  }
}
