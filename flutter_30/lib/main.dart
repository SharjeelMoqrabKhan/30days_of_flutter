import 'package:flutter/material.dart';
import 'package:flutter_30/core/store.dart';
import 'package:flutter_30/pages/cartPage.dart';
import 'package:flutter_30/pages/home_page.dart';
import 'package:flutter_30/pages/log_in_page.dart';
import 'package:flutter_30/util/routes/myRoutes.dart';
import 'package:flutter_30/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(
    VxState(
      store: MyStore(),
      child: MyApp(),
    ),
  );
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
