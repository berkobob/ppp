import 'package:flutter/material.dart';
import 'package:ppp/controllers/controller.dart';
import 'package:ppp/models/item.dart';
import 'package:provider/provider.dart';

class Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Item>>(
        future: Provider.of<Controller>(context, listen: false).getItems(),
        // future: context.watch<Controller>().getItems(),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return Wrap(
                spacing: 20.0,
                children: snapshot.data
                    .map((item) => Chip(label: Text(item.title)))
                    .toList());
          return Center(child: CircularProgressIndicator());
        });
  }
}
