import 'package:flutter/material.dart';
import 'package:flutter_30/pages/cart.dart';
import 'package:flutter_30/pages/home_page.dart';
import 'package:flutter_30/pages/log_in_page.dart';
import 'package:flutter_30/util/routes/myRoutes.dart';
import 'package:flutter_30/widgets/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        '/': (context) => LogInPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LogInPage(),
        MyRoutes.cartPageRoute: (context) => Cart(),
      },
    );
  }
}
