import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String greeting = 'Welcome to 30 days of flutter';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Center(
          child: Text('$greeting'),
        ),
      ),
    );
  }
}
