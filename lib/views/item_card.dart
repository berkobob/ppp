import 'dart:developer' as d;

import 'package:flutter/material.dart';
import 'package:ppp/controllers/controller.dart';
import 'package:ppp/models/item.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  ItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    return DragTarget<Item>(
      onWillAccept: (data) {
        d.log(
            '$item of type ${item.runtimeType} should consider accepting $data of type ${data.runtimeType}',
            name: 'ItemCard');
        return true;
      },
      onAccept: (data) {
        String x = '$item is accepting $data of type ${data.runtimeType}';
        d.log(x, name: 'onAccept');
        Provider.of<Controller>(context, listen: false)
            .add(Item(id: '0', source: Source.block, title: x));
      },
      builder: (context, incoming, rejected) {
        return Draggable(
          childWhenDragging: MyItem(item, dragging: true),
          data: item,
          feedback: MyItem(item),
          child: MyItem(item),
        );
      },
    );
  }
}

class MyItem extends StatelessWidget {
  final Item item;
  final bool dragging;

  MyItem(this.item, {this.dragging = false});
  final avatars = {
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
    "dragging": CircleAvatar(
      radius: 10.0,
      backgroundColor: Color(0xfafafa),
    )
  };

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Chip(
        avatar: dragging ? avatars['dragging'] : avatars[item.source],
        label: Text(
          item.title,
          style: TextStyle(
            color: dragging ? Color(0xfafafa) : Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 18.0,
          ),
        ),
        deleteIcon: Icon(Icons.delete,
            size: 18.0, color: dragging ? Color(0xfafafa) : Colors.black),
        onDeleted: () {},
      ),
    );
  }
}
