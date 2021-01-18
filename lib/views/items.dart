import 'dart:developer' as d;

import 'package:flutter/material.dart';
import 'package:ppp/controllers/controller.dart';
import 'package:ppp/models/item.dart';
import 'package:provider/provider.dart';

final sources = {
  Source.reminders: CircleAvatar(
    radius: 10.0,
    backgroundImage: AssetImage('assets/images/apple.png'),
    backgroundColor: Color(0xfafafa),
  ),
  Source.tasks: CircleAvatar(
    radius: 8.0,
    backgroundImage: AssetImage('assets/images/google.png'),
    backgroundColor: Color(0xfafafa),
  ),
  Source.onenotes: CircleAvatar(
    radius: 10.0,
    backgroundImage: AssetImage('assets/images/microsoft.png'),
    backgroundColor: Color(0xfafafa),
  ),
};

class Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    d.log("Building", name: "Items");
    return ListView.builder(
        itemCount: context.watch<Controller>().items.length,
        itemBuilder: (context, index) {
          final item = context.watch<Controller>().items[index];
          Controller controller = context.read<Controller>();
          return Dismissible(
            key: Key(item.id),
            confirmDismiss: (direction) =>
                direction == DismissDirection.endToStart
                    ? context.read<Controller>().remove(item)
                    : context.read<Controller>().add(item),
            child: ListTile(
              leading: sources[item.source],
              title: Text(item.title),
              subtitle: item.hasNotes ? Text(item.notes) : null,
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Confirm'),
                    actions: [
                      FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Cancel'),
                      ),
                      FlatButton(
                        onPressed: () {
                          controller.delete(item);
                          Navigator.of(context).pop();
                        },
                        child: Text('Confirm'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
