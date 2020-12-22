import 'package:ppp/models/item.dart';

enum Service {
  idle,
  busy,
  access,
  denied,
}

abstract class Base {
  Service status = Service.idle;
  Future hasAccess();
  Function notifyListeners;
  List<Item> items;
  Future getItems([String list]);

  updateStatus(Service status) {
    this.status = status;
    notifyListeners();
  }

  @override
  String toString() {
    return '${this.runtimeType}: $status';
  }
}
