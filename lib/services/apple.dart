import 'package:flutter/services.dart';

import '../models/item.dart';

class Apple {
  final platform = MethodChannel('family.lever.ppp/reminders');

  Future<bool> get hasAccess async => await platform.invokeMethod('hasAccess');

  Future<String> get defaultList async =>
      await platform.invokeMethod('defaultList');

  Future<List<String>> get lists async => await platform.invokeMethod('lists');

  Future<List> get reminders async =>
      await platform.invokeMethod('getReminders', {"calendar": "Reminders"});

  Future delete(Item reminder) async => await platform
      .invokeMethod("deleteReminderWithId", {"reminder": reminder.id});
}
