import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ppp/models/task.dart';
import 'package:ppp/models/task_list.dart';
import 'package:ppp/services/login.dart';

class Google {
  GoogleLogin googleLogin = GoogleLogin();
  final List<TaskList> _lists = [];
  final String rootUrl = 'https://tasks.googleapis.com/tasks/v1/';

  Future<Map<String, String>> get header async =>
      {'Authorization': 'Bearer ' + await googleLogin.token};
  List<TaskList> get lists => _lists;
  bool get hasData => _lists.isNotEmpty;

  Future<List<TaskList>> getLists() async {
    final url = rootUrl + 'users/@me/lists';
    final headers = await header;
    var response = await http.get(url, headers: headers);
    if (response.statusCode != 200) {
      print('Google.dart - getLists(): Status code: ${response.statusCode}');
      await googleLogin.refreshToken();
      response = await http.get(url, headers: headers);
      print('Google.dart - getLists(): Status code: ${response.statusCode}');
    }
    final taskList = jsonDecode(response.body)['items'];
    taskList.forEach((list) => _lists.add(TaskList(list)));
    return _lists;
  }

  Future<List<dynamic>> getTasks({TaskList taskList}) async {
    final url = rootUrl + 'lists/' + taskList.id + '/tasks';
    final response = await http.get(url, headers: await header);
    if (response.statusCode != 200) return null;
    final tasks = jsonDecode(response.body)['items'];
    return tasks.map((task) => Task(task)).toList();
  }

  Future insertTask({TaskList taskList, Task task}) async {
    final url = rootUrl + 'lists/' + taskList.id + '/tasks';
    final body = task.toJson();
    print(body);
    final response = await http.post(url, headers: await header, body: body);
    if (response.statusCode != 200) print(response.statusCode);
    print(response.reasonPhrase);
  }
}
