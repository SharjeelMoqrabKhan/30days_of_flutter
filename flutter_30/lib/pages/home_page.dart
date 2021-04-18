import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String greeting = 'Welcome to 30 days of flutter :)';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
      ),
      body: Center(
        child: Text('$greeting'),
      ),
      drawer: Drawer(),
    );
  }
}
