import 'package:flutter/material.dart';
import 'package:ppp/models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  ItemCard(this.item);

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
  };

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: avatars[item.source],
      title: Text(item.title),
      trailing: Icon(Icons.delete),
    );
  }
}
