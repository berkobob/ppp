import 'base.dart';

class Tasks extends Base {
  Future hasAccess() async {
    updateStatus(ServiceStatus.busy);
    await Future.delayed(Duration(seconds: 5));
    updateStatus(ServiceStatus.access);
  }
}
