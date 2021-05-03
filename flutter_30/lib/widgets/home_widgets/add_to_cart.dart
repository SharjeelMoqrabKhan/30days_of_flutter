import 'package:flutter/material.dart';
import 'package:flutter_30/model/cart.dart';
import 'package:flutter_30/model/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key key,
    this.catalog,
  }) : super(key: key);

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          final _catalog = Catelog();
          _cart.add(catalog);
          _cart.catelog = _catalog;
          isInCart = isInCart.toggle();
          // setState(() {});
        }
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: isInCart
          ? Icon(Icons.done)
          : Text(
              'Add to cart',
              style: TextStyle(color: Colors.white),
            ),
    );
  }
}
