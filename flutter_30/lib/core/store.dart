import 'package:flutter_30/model/cart.dart';
import 'package:flutter_30/model/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  // add models that's need to be manipulate.
  Catelog catelog;
  CartModel cart;

  //making constructor of class
  MyStore() {
    catelog = Catelog();
    cart = CartModel();
    cart.catelog = catelog;
  }
}
