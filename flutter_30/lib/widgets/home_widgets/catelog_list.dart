import 'package:flutter/material.dart';
import 'package:flutter_30/model/catelog.dart';
import 'package:flutter_30/pages/home_page_details.dart';
import 'package:flutter_30/widgets/home_widgets/catelog_image.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_to_cart.dart';

class CatelogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Catelog.items.length,
      itemBuilder: (context, index) {
        final catelog = Catelog.items[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePageDetails(catelog: catelog),
              ),
            );
          },
          child: CatelogItem(
            catalog: catelog,
          ),
        );
      },
    );
  }
}

class CatelogItem extends StatelessWidget {
  final Item catalog;

  const CatelogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: catalog.id.toString(),
            child: CatelogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  catalog.name.text.lg
                      .color(Theme.of(context).accentColor)
                      .make(),
                  catalog.desc.text.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      '\$ ${catalog.price}'.text.make(),
                      AddToCart(catalog: catalog)
                    ],
                  ).pOnly(right: 8.0)
                ],
              ),
            ),
          )
        ],
      ),
    ).color(Theme.of(context).cardColor).roundedLg.square(150).py16.make();
  }
}
