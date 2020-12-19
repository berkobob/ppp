enum ServiceStatus { idle, busy, access, denied }

abstract class Base {
  ServiceStatus status = ServiceStatus.idle;
  Future hasAccess();
  Function notifyListeners;

  Future<List<dynamic>> getItems(String list);

  updateStatus(ServiceStatus status) {
    print(
        '${this.runtimeType.toString()} is changing status from ${this.status} to $status');
    this.status = status;
    notifyListeners();
  }

  @override
  String toString() {
    return status.toString();
  }
}
