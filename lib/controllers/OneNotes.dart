import 'base.dart';

class OneNotes extends Base {
  Future hasAccess() async {
    updateStatus(ServiceStatus.busy);
    await Future.delayed(Duration(seconds: 2));
    updateStatus(ServiceStatus.access);
  }

  Future<List<dynamic>> getItems(String list) async {
    return null;
  }
}
