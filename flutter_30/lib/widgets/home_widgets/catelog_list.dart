import 'package:flutter/material.dart';
import 'package:flutter_30/model/cart.dart';
import 'package:flutter_30/model/catelog.dart';
import 'package:flutter_30/pages/home_page_details.dart';
import 'package:flutter_30/widgets/home_widgets/catelog_image.dart';
import 'package:velocity_x/velocity_x.dart';

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

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key key,
    this.catalog,
  }) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final _cart = CartModel();
        final _catalog = Catelog();
        _cart.add(widget.catalog);
        _cart.catelog = _catalog;
        isAdded = isAdded.toggle();
        setState(() {});
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: isAdded
          ? Icon(Icons.done)
          : Text(
              'Add to cart',
              style: TextStyle(color: Colors.white),
            ),
    );
  }
}
