import 'dart:developer' as d;

import 'package:flutter/services.dart';
import 'package:ppp/models/item.dart';
import 'package:ppp/models/reminder.dart';

import 'base.dart';

class Reminders extends Base {
  static const _channel = const MethodChannel('family.lever.ppp/reminders');

  Future hasAccess() async {
    updateStatus(Service.busy);
    final result = await _channel.invokeMethod('hasAccess');
    updateStatus(result ? Service.access : Service.denied);
    await getItems();
  }

  Future<String> get defaultList async {
    final String list = await _channel.invokeMethod('defaultList');
    return list;
  }

  Future<List<dynamic>> get lists async {
    return await _channel.invokeMethod("lists");
  }

  Future getItems() async {
    updateStatus(Service.busy);
    try {
      final reminders = await _channel
          .invokeMethod("getReminders", {"calendar": "Reminders"});
      items = reminders
          .map<Reminder>((reminder) => Reminder.fromJson(reminder))
          .toList();
      updateStatus(Service.access);
    } catch (error) {
      print(error);
      updateStatus(Service.denied);
    }
  }

  Future deleteReminderWithId(String reminder) async {
    updateStatus(Service.busy);
    await _channel.invokeMethod("deleteReminderWithId", {"reminder": reminder});
    updateStatus(Service.access);
  }

  Future<bool> delete(Item item) async {
    updateStatus(Service.busy);
    d.log('Deleting $item from ${item.source}');
    await _channel.invokeMethod("deleteReminderWithId", {"reminder": item.id});
    updateStatus(Service.access);
    return true;
  }
}
