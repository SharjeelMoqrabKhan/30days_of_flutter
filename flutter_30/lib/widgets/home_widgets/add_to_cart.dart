import 'package:flutter/material.dart';
import 'package:flutter_30/core/store.dart';
import 'package:flutter_30/model/cart.dart';
import 'package:flutter_30/model/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key key,
    this.catalog,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.listen(context, to: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
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
