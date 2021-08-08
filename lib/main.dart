import 'package:flutter/material.dart';

import 'views/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PPP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('PPP')),
        body: MainScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
