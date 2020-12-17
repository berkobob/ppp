import 'package:flutter/material.dart';
import 'package:ppp/controllers/OneNotes.dart';
import 'package:ppp/controllers/reminders.dart';
import 'package:ppp/controllers/tasks.dart';
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
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Reminders()),
          ChangeNotifierProvider(create: (_) => Tasks()),
          ChangeNotifierProvider(create: (_) => OneNotes()),
        ],
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
