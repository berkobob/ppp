import 'package:flutter/material.dart';
import 'package:ppp/controllers/OneNotes.dart';
import 'package:ppp/controllers/controller.dart';
import 'package:ppp/controllers/reminders.dart';
import 'package:ppp/controllers/tasks.dart';
import 'package:provider/provider.dart';

class StatusBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text(
              "Reminders",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: context.watch<Reminders>().status == ServiceStatus.access
                ? Colors.green
                : Colors.red,
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text(
              "Tasks",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: context.watch<Tasks>().status == ServiceStatus.access
                ? Colors.green
                : Colors.red,
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text(
              "OneNotes",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: context.watch<OneNotes>().status == ServiceStatus.access
                ? Colors.green
                : Colors.red,
          ),
        ),
      ],
    );
  }
}
