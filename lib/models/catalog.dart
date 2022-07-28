// ignore_for_file: unused_import

import 'package:flutter/foundation.dart';

class CatalogModel {
// //made it comment after using VxState function in MyApp.
// //making singleton so that every time same object is created when called.
//   static final catalogtModel = CatalogModel._internal();
//   CatalogModel._internal();
//   factory CatalogModel() => catalogtModel;

  static List<Item> items = [];
  //left intentionally in order to test exception
  //list can't be empty or null so in reality use the below data filled
// = [
  //   Item(
  //     01,
  //     "Samsung M31s",
  //     "8Gb RAM,128Gb Memory,Camera:(R:64::F:32),Battery:6000 mAh",
  //     22000,
  //     "Black",
  //     "https://eu.etoren.com/upload/images/0.84204400_1603162634_samsung-galaxy-m31s-dual-sim-m317fd-128gb-black-6gb-ram.jpg",
  //   )
  // ];
  //this was done in inital stage of data entry in order to add and test
  //a item in the bosy of the home page
  Item getByID(int id) =>
      items.firstWhere((element) => element.id == id, orElse: (null));
  Item getByPos(int pos) => items[pos];
}

class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(map["id"], map["name"], map["desc"], map["price"], map["color"],
        map["image"]);
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}
