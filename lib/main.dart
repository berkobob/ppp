import 'dart:developer' as d;

import 'package:flutter/material.dart';
import 'package:ppp/views/home_page.dart';

void main() {
  runApp(PPP());
}

class PPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    d.log("Building", name: "PPP", sequenceNumber: 1);
    return MaterialApp(
      title: 'PPP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
