import 'dart:developer' as d;

import 'package:flutter/material.dart';
import 'package:ppp/controllers/controller.dart';
import 'package:provider/provider.dart';

import 'status_tile.dart';
import 'items.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    d.log("Building", name: "HomePage");
    return Scaffold(
      appBar: AppBar(
        title: Text('PPP v1.3.0'),
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
                      .toList()),
            ),
            Expanded(
              child: Builder(
                builder: (context) => RefreshIndicator(
                    onRefresh: () async =>
                        Provider.of<Controller>(context, listen: false)
                            .refresh(),
                    child: Items()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
