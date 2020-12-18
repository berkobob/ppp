import 'package:flutter/material.dart';
import 'package:ppp/controllers/reminders.dart';
import 'package:ppp/models/reminder.dart';

class Items extends StatelessWidget {
  final Future<List<Reminder>> reminders = Reminders().getReminders("");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Reminder>>(
        future: reminders,
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return Wrap(
                spacing: 20.0,
                children: snapshot.data
                    .map((item) => Chip(label: Text(item.title)))
                    .toList());
          return CircularProgressIndicator();
        });
  }
}
