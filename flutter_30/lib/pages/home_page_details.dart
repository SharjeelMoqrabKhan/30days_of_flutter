import 'package:flutter/material.dart';
import 'package:flutter_30/model/catelog.dart';

class HomePageDetails extends StatelessWidget {
  final Item catelog;

  const HomePageDetails({Key key, @required this.catelog})
      : assert(catelog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.network(catelog.image),
        ],
      ),
    );
  }
}
