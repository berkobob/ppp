import 'package:flutter/material.dart';
import 'package:ppp/controllers/base.dart';
import 'package:ppp/controllers/controller.dart';
import 'package:provider/provider.dart';

class StatusBar extends StatelessWidget {
  final statusColors = {
    ServiceStatus.access: Colors.green,
    ServiceStatus.denied: Colors.red,
    ServiceStatus.busy: Colors.yellow,
    ServiceStatus.idle: Colors.black
  };

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
            color: statusColors[context.watch<Controller>().reminders.status],
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
            color: statusColors[context.watch<Controller>().tasks.status],
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
            color: statusColors[context.watch<Controller>().oneNotes.status],
          ),
        ),
      ],
    );
  }
}
