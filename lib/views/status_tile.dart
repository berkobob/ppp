import 'package:flutter/material.dart';
import 'package:ppp/controllers/base.dart';
import 'package:ppp/controllers/controller.dart';
import 'package:provider/provider.dart';

class StatusTile extends StatelessWidget {
  final String source;
  StatusTile(this.source);

  final statusColors = {
    ServiceStatus.access: Colors.green,
    ServiceStatus.denied: Colors.red,
    ServiceStatus.busy: Colors.yellow,
    ServiceStatus.idle: Colors.black
  };

  @override
  Widget build(BuildContext context) {
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
        color: statusColors[context.watch<Controller>().sources[source].status],
      ),
    );
  }
}
