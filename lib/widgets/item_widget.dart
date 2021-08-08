import 'package:flutter/material.dart';

import '../models/item.dart';

class ItemWidget extends StatelessWidget {
  final sources = {
    Source.Apple: CircleAvatar(
      radius: 10.0,
      backgroundImage: AssetImage('assets/images/apple.png'),
      backgroundColor: Color(0xfafafa),
    ),
    Source.Google: CircleAvatar(
      radius: 8.0,
      backgroundImage: AssetImage('assets/images/google.png'),
      backgroundColor: Color(0xfafafa),
    ),
    Source.Other: CircleAvatar(
      radius: 10.0,
      backgroundImage: AssetImage('assets/images/microsoft.png'),
      backgroundColor: Color(0xfafafa),
    ),
  };

  final Item item;
  final Function onDelete;
  final Function onDismiss;
  final Function onAdd;
  ItemWidget(this.item,
      {required this.onDelete, required this.onDismiss, required this.onAdd});

  @override
  Widget build(BuildContext context) => Dismissible(
        key: Key(item.id),
        confirmDismiss: (direction) => direction == DismissDirection.endToStart
            ? onDismiss(item)
            : onAdd(item),
        child: Card(
          child: ListTile(
            leading: sources[item.source],
            title: Text(item.title),
            subtitle: Text(item.notes ?? ""),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => showDialog(
                context: context,
                builder: (context) =>
                    AlertDialog(title: Text('Confirm'), actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      onDelete(item);
                      Navigator.of(context).pop();
                    },
                    child: Text('Confirm'),
                  ),
                ]),
              ),
            ),
          ),
        ),
      );
}
