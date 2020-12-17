import 'controller.dart';

class OneNotes extends Controller {
  Future hasAccess() async {
    updateStatus(ServiceStatus.busy);
    await Future.delayed(Duration(seconds: 2));
    updateStatus(ServiceStatus.access);
  }
}
