import 'controller.dart';

class Tasks extends Controller {
  Future hasAccess() async {
    updateStatus(ServiceStatus.busy);
    await Future.delayed(Duration(seconds: 5));
    updateStatus(ServiceStatus.access);
  }
}
