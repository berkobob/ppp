import 'package:ppp/models/item.dart';
import 'package:ppp/models/task.dart';

import '../services/google.dart';
import 'base_view_model.dart';

class GoogleVM extends BaseViewModel {
  static final GoogleVM _googleVM = GoogleVM._internal();
  factory GoogleVM() => _googleVM;
  GoogleVM._internal();

  final service = Google();

  @override
  String name = 'Tasks';

  @override
  Source source = Source.Google;

  @override
  Future<List<Item>> getItems() async {
    state = ViewState.busy;
    final tasks = (await service.getTasks())
        .map<Item>((json) => Task(json as Map<String, dynamic>))
        .toList();
    state = ViewState.idle;
    return tasks;
  }

  @override
  Future deleteItem(Item task) async {
    state = ViewState.busy;
    await service.deleteTask(task.id);
    state = ViewState.idle;
  }

  Future add(Item item) async {
    state = ViewState.busy;
    await service.add(item);
    state = ViewState.idle;
  }
}
