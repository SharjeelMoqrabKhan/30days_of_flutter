import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogImage extends StatelessWidget {
  final String image;

  const CatelogImage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .p8
        .color(Theme.of(context).canvasColor)
        .make()
        .p16()
        .w32(context);
  }
}
