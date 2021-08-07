import '../models/item.dart';
import '../models/reminder.dart';
import '../services/apple.dart';
import 'base_view_model.dart';

class AppleVM extends BaseViewModel {
  static final AppleVM _appleVM = AppleVM._internal();
  factory AppleVM() => _appleVM;
  AppleVM._internal();

  final service = Apple();

  @override
  String name = 'Reminders';

  @override
  Source source = Source.Apple;

  @override
  ViewState state = ViewState.idle;

  @override
  Future<List<Item>> getItems() async {
    state = ViewState.busy;
    final reminders = (await service.reminders)
        .map<Item>((json) => Reminder.fromJson(json))
        .toList();
    state = ViewState.idle;
    return reminders;
  }

  @override
  Future deleteItem(Item item) async {
    state = ViewState.busy;
    await service.delete(item);
    state = ViewState.idle;
  }
}
