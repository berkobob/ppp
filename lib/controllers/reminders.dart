import 'package:flutter/services.dart';

class Reminders {
  static const _channel = const MethodChannel('family.lever.ppp/reminders');

  Future<bool> get hasAccess async {
    final r = await _channel.invokeMethod('hasAccess');
    final l = await _channel.invokeMethod('defaultList');
    print(r);
    print(l);
    return r;
  }
}
