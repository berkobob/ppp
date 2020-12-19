import 'package:flutter/material.dart';
import 'package:ppp/controllers/controller.dart';
import 'package:provider/provider.dart';

import 'status_tile.dart';
import 'items.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PPP'),
      ),
      body: ChangeNotifierProvider<Controller>(
        create: (_) => Controller(),
        child: Column(
          children: [
            Builder(
                builder: (context) => Row(
                    children: Provider.of<Controller>(context, listen: false)
                        .sources
                        .keys
                        .map((source) => StatusTile(source))
                        .toList())

                // final sources =
                //     Provider.of<Controller>(context, listen: false).sources;
                // List<Widget> status = [];
                // sources.forEach((name, source) =>
                //     status.add(StatusTile(name: name, source: source)));
                // return Row(children: status);
                ),
            // StatusBar(),
            Expanded(child: Items()),
          ],
        ),
      ),
    );
  }
}
