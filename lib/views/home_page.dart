import 'package:flutter/material.dart';
import 'package:ppp/controllers/controller.dart';
import 'package:provider/provider.dart';

import 'status_bar.dart';
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
            StatusBar(),
            Expanded(child: Items()),
          ],
        ),
      ),
    );
  }
}
