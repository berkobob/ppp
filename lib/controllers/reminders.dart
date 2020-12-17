import 'package:flutter/services.dart';

import 'controller.dart';

class Reminders extends Controller {
  static const _channel = const MethodChannel('family.lever.ppp/reminders');

  Future hasAccess() async {
    updateStatus(ServiceStatus.busy);
    final result = await _channel.invokeMethod('hasAccess');
    print('Result: $result');
    updateStatus(result ? ServiceStatus.access : ServiceStatus.denied);
  }
}
