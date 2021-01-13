import 'dart:developer' as d;

import 'package:flutter/material.dart';
import 'package:ppp/controllers/controller.dart';
import 'package:ppp/models/item.dart';
import 'package:provider/provider.dart';

class StatusTile extends StatelessWidget {
  final Source source;
  StatusTile(this.source);

  final sources = {
    Source.reminders: "Reminders",
    Source.tasks: "Tasks",
    Source.onenotes: "OneNotes"
  };

  final statusColors = [
    Colors.blue, // idle
    Colors.yellow, // busy
    Colors.green, // access
    Colors.red, // denied
  ];

  @override
  Widget build(BuildContext context) {
    d.log("Building $source", name: "StatusTile");
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Text(
          sources[source],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: statusColors[
            context.watch<Controller>().sources[source].status.index],
      ),
    );
  }
}
