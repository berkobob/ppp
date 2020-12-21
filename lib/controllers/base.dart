import 'package:ppp/models/item.dart';

enum ServiceStatus { idle, busy, access, denied }

abstract class Base {
  ServiceStatus status = ServiceStatus.idle;
  Future hasAccess();
  Function notifyListeners;
  List<Item> items;
  bool get isReady => status == ServiceStatus.access;

  updateStatus(ServiceStatus status) {
    this.status = status;
    notifyListeners();
  }

  @override
  String toString() {
    return status.toString();
  }
}
