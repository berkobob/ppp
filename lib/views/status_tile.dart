import 'dart:developer' as d;

import 'package:flutter/material.dart';
import 'package:ppp/controllers/controller.dart';
import 'package:provider/provider.dart';

class StatusTile extends StatelessWidget {
  final String source;
  StatusTile(this.source);

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
          source,
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
