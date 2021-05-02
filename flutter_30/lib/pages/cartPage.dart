import 'package:flutter/material.dart';
import 'package:flutter_30/model/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Cart'),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: _cartList(),
            ),
          ),
          Divider(),
          _cartTotal()
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _cartTotal extends StatelessWidget {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '\$${_cart.totalPrice}',
            style:
                TextStyle(color: Theme.of(context).accentColor, fontSize: 32),
          ),
          SizedBox(
            width: 100,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).buttonColor),
            ),
            child: Text('Buy'),
          ).w32(context)
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _cartList extends StatefulWidget {
  @override
  __cartListState createState() => __cartListState();
}

// ignore: camel_case_types
class __cartListState extends State<_cartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(icon: Icon(Icons.remove), onPressed: () {}),
          title: Text(_cart.items[index].name),
        );
      },
    );
  }
}
