import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.deepPurple,
        cardColor: Colors.white,
        canvasColor: creamColor,
        buttonColor: darkColor,
        accentColor: Colors.deepPurple,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            textTheme: Theme.of(context).textTheme),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.deepPurple,
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        buttonColor: lightBlueColor,
        accentColor: Vx.indigo500,
        appBarTheme: AppBarTheme(
            color: Colors.black,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            textTheme: Theme.of(context).textTheme),
      );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkColor = Vx.gray900;
  static Color darkCreamColor = Color(0xff050A30);
  static Color lightBlueColor = Vx.indigo500;
}
