import 'package:flutter/foundation.dart';

import '../models/item.dart';

import 'apple_view_model.dart';
import 'base_view_model.dart';
import 'google_view_model.dart';
import 'test_view_model.dart';

class ViewModel with ChangeNotifier {
  // final sources = <BaseViewModel>[AppleVM(), TestVM()];
  final sources = <Source, BaseViewModel>{
    Source.Apple: AppleVM(),
    Source.Google: GoogleVM(),
    Source.Other: TestVM()
  };
  final items = <Item>[];

  ViewModel() {
    getItems();
    notifyListeners();
  }

  Future getItems() async {
    items.clear();
    sources.values.forEach((source) async {
      items.addAll(await source.getItems());
      notifyListeners();
    });
  }

  Future<void> delete(Item item) async {
    final source = sources[item.source]!;
    _setState(source, ViewState.busy);
    await source.deleteItem(item);
    items.remove(item);
    _setState(source, ViewState.idle);
  }

  Future<bool> dismiss(Item item) async {
    notifyListeners();
    items.remove(item);
    return true;
  }

  Future<bool> add(Item item) async {
    await sources[Source.Google]!.add(item);
    await delete(item);
    return false;
  }

  void _setState(BaseViewModel source, ViewState state) {
    source.state = state;
    notifyListeners();
  }
}
