import '../models/item.dart';

import 'base_view_model.dart';

class TestVM extends BaseViewModel {
  static final TestVM _testVM = TestVM._internal();
  factory TestVM() => _testVM;
  TestVM._internal();

  @override
  String name = 'Test';

  @override
  Source source = Source.Other;

  @override
  Future<List<Item>> getItems() async {
    state = ViewState.busy;
    await Future.delayed(Duration(seconds: 2));
    state = ViewState.idle;
    return [
      Item(source: Source.Other, id: '123', title: 'Test item'),
      Item(source: Source.Other, id: '321', title: 'Test item 2')
    ];
  }

  @override
  Future deleteItem(Item item) async {
    await Future.delayed(Duration(milliseconds: 2250));
  }
}
