import 'package:flutter/material.dart';
import 'package:ppp/controllers/controller.dart';
import 'package:provider/provider.dart';

class Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20.0,
      children: context
          .watch<Controller>()
          .items
          .map((item) => Chip(label: Text(item.title)))
          .toList(),
    );
  }
}
