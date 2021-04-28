import 'package:flutter/material.dart';
import 'package:flutter_30/widgets/theme.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Cart'),
      ),
      backgroundColor: MyTheme.creamColor,
    );
  }
}
