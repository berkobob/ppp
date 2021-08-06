import '../models/item.dart';

enum ViewState { idle, busy, denied }

abstract class BaseViewModel {
  abstract Source source;
  abstract String name;
  ViewState state = ViewState.idle;
  Future<List<Item>> getItems();
  Future deleteItem(Item item);
}
