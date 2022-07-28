// ignore_for_file: unnecessary_getters_setters

import 'package:my_flutter/core/store.dart';
import 'package:my_flutter/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //made it comment after using VxState function in MyApp.
  // //making singleton so that every time same object is created when called.
  // static final cartModel = CartModel._internal();
  // CartModel._internal();
  // factory CartModel() => cartModel;

//catalog field
  late CatalogModel _catalog;

//now creating getter and setter of this _catalog as it's private and hence can't be used
//directy outside of the class.
  CatalogModel get catalog => _catalog; //getter

  set catalog(CatalogModel newCatalog) {
    //setter
    _catalog = newCatalog;
  }

//collection of ids-> store id's of each items.
  final List<int> _itemids = [];

//get item in the cart
  List<Item> get items => _itemids.map((id) => _catalog.getByID(id)).toList();

//adding cart value after addition of new items.
  num get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);

//creating function in order to add new element in the cart
  // void add(Item item) {
  //   _itemids.add((item.id.toInt()));
  // }

//creating function in order to remove new element in the cart
  // void remove(Item item) {
  //   _itemids.remove(item.id);
  // }
}

class AddMutation extends VxMutation<MyStore> {
  final Item items;

  AddMutation(this.items);
  @override
  perform() {
    store!.cart._itemids.add(items.id.toInt());
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item items;

  RemoveMutation(this.items);
  @override
  perform() {
    store!.cart._itemids.remove(items.id.toInt());
  }
}
