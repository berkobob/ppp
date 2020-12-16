import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PPP'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Source("Reminders",
                    color: Colors.green[300], logo: 'assets/images/apple.png'),
                Source("Tasks",
                    color: Colors.green[300], logo: 'assets/images/google.png'),
                Source("OneNotes",
                    color: Colors.green[300],
                    logo: 'assets/images/microsoft.png'),
              ],
            ),
            Expanded(child: Center(child: Text("PPP")))
          ],
        ));
  }
}

class Source extends StatelessWidget {
  final String source;
  final Color color;
  final String logo;
  Source(this.source, {this.color, this.logo});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Image.asset(logo, height: 25.0),
            ),
            Text(source),
          ],
        ),
        color: color,
      ),
    );
  }
}
