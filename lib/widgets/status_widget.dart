import 'package:flutter/material.dart';

class StatusTile extends StatelessWidget {
  static const statusColours = [
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.red
  ];
  final String name;
  final int status;
  StatusTile({required this.name, required this.status});

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(name, style: const TextStyle(color: Colors.white)),
          color: statusColours[status],
        ),
      );
}
