import 'package:flutter/material.dart';
import 'package:ppp/controllers/controller.dart';
import 'package:ppp/models/reminder.dart';
import 'package:provider/provider.dart';

class Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Reminder>>(
        future: Provider.of<Controller>(context).getItems(),
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
