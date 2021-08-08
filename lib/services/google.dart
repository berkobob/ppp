import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';

import '../models/item.dart';
import '../models/task_list.dart';

class Google {
  static final Google _google = Google._internal();
  factory Google() => _google;
  Google._internal();

  final String rootUrl = 'https://tasks.googleapis.com/tasks/v1/';
  final GoogleSignIn googleSignIn =
      GoogleSignIn(scopes: ['https://www.googleapis.com/auth/tasks']);
  String? _token;

  Future<String?> get token async {
    if (_token == null) await refreshToken();
    return _token;
  }

  late final TaskList taskList;
  late final TaskList captureList;
  bool ready = false;

  Future hasAccess() async {
    await login();
    final lists = await getLists();
    taskList = lists.firstWhere((list) => list.title == 'My Tasks');
    captureList = lists.firstWhere((list) => list.title == 'Capture');
    ready = true;
  }

  Future<List> getTasks() async {
    if (!ready) await hasAccess();
    final url = Uri.parse(rootUrl + 'lists/' + captureList.id + '/tasks');
    final response = await get(url, headers: await header);
    return jsonDecode(response.body)['items'];
  }

  Future deleteTask(String id) async {
    final url = Uri.parse(rootUrl + 'lists/' + captureList.id + '/tasks/' + id);
    await delete(url, headers: await header);
  }

  Future add(Item item) async {
    final url = Uri.parse(rootUrl + 'lists/' + taskList.id + '/tasks');
    final body = json.encode(item.toJson());
    final headers = await header;
    print('Body: $body');
    await post(url, headers: headers, body: body);
  }

  // private methods

  Future<List> getLists() async {
    final url = Uri.parse(rootUrl + 'users/@me/lists');
    final response = await get(url, headers: await header);
    final json = jsonDecode(response.body)['items'];
    return json.map((list) => TaskList(list)).toList();
  }

  Future<Map<String, String>> get header async {
    // if (await token == null)
    return {'Authorization': 'Bearer ' + (await token ?? '')};
  }

  // Authentication methods

  Future login() async {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    _token = googleSignInAuthentication?.accessToken;
  }

  Future refreshToken() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signInSilently();
    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    _token = googleSignInAuthentication?.accessToken;
    print('Token = $_token');
  }
}
