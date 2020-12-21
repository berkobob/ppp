import 'package:flutter/services.dart';
import 'package:ppp/models/reminder.dart';

import 'base.dart';

class Reminders extends Base {
  static const _channel = const MethodChannel('family.lever.ppp/reminders');

  Future hasAccess() async {
    updateStatus(Service.busy);
    final result = await _channel.invokeMethod('hasAccess');
    items = await getItems("");
    updateStatus(result ? Service.access : Service.denied);
  }

  Future<String> get defaultList async {
    final String list = await _channel.invokeMethod('defaultList');
    return list;
  }

  Future<List<dynamic>> get lists async {
    return await _channel.invokeMethod("lists");
  }

  Future<List<Reminder>> getItems(String list) async {
    if (status != Service.busy) updateStatus(Service.busy);

    final reminders =
        await _channel.invokeMethod("getReminders", {"calendar": list});
    updateStatus(Service.idle);
    return reminders
        .map<Reminder>((reminder) => Reminder.fromJson(reminder))
        .toList();
  }

  Future deleteReminderWithId(String reminder) async {
    await _channel.invokeMethod("deleteReminderWithId", {"reminder": reminder});
  }
}
