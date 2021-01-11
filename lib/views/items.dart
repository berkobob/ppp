import 'dart:developer' as d;

import 'package:flutter/material.dart';
import 'package:ppp/controllers/controller.dart';
import 'package:provider/provider.dart';

import 'item_card.dart';

class Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    d.log("Building", name: "Items");
    final refresh = Provider.of<Controller>(context, listen: false).refresh;
    return RefreshIndicator(
      onRefresh: () async => await refresh(),
      child: Wrap(
        spacing: 50.0,
        children: context
            .watch<Controller>()
            .items
            .map((item) => ItemCard(item))
            .toList(),
      ),
    );
  }
}
