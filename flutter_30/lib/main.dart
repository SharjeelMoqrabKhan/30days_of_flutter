import 'package:flutter/material.dart';
import 'package:flutter_30/pages/home_page.dart';
import 'package:flutter_30/pages/log_in_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LogInPage()
      },
    );
  }
}
