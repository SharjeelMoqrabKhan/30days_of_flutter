import 'package:flutter/material.dart';
import 'package:flutter_30/widgets/my_drawer.dart';

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
      drawer: MyDrawer(),
    );
  }
}
