import 'package:flutter_30/core/store.dart';
import 'package:flutter_30/model/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

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
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store.cart._itemsIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store.cart._itemsIds.remove(item.id);
  }
}
