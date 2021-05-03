import 'package:flutter_30/model/catelog.dart';

class CartModel {

//catelog feild
  Catelog _catalog;

//getting IDs of items
  final List<int> _itemsIds = [];

//get catelog
  Catelog get catelog => _catalog;

//set catelog
  set catelog(Catelog newCatelog) {
    assert(newCatelog != null);
    _catalog = newCatelog;
  }

  // Get items in the cart
  List<Item> get items => _itemsIds.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add item
  void add(Item item) {
    _itemsIds.add(item.id);
  }

  //Remove item
  void remove(Item item) {
    _itemsIds.remove(item.id);
  }
}
