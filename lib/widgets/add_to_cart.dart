// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_flutter/core/store.dart';
import 'package:my_flutter/models/cart.dart';
import 'package:my_flutter/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCartList extends StatelessWidget {
  final Item catalog;
  AddToCartList({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  //final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    //final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        //final _catalog = CatalogModel();
        if (!isInCart) {
          // _cart.catalog = _catalog; //done before knowing vxstate
          // _cart.add(catalog);
          // isInCart = !isInCart;
          AddMutation(catalog);
          // Fluttertoast.showToast(
          //     msg: "Item Added Successfully",
          //     toastLength: Toast.LENGTH_LONG,
          //     gravity: ToastGravity.CENTER,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.orange,
          //     textColor: Colors.white);

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(milliseconds: 1000),
              content: "Item Added Successfully".text.make()));
          //setState(() {});
        }
      },
      child: isInCart
          ? Row(
              children: [
                Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  color: Colors.yellow.shade900,
                ),
                " Added".text.white.bold.xl.make(),
              ],
            )
          : "Add To Cart".text.white.bold.xl.make(),
      style: TextButton.styleFrom(
          shape: StadiumBorder(
              side: BorderSide(
                  width: context.cardColor == Colors.grey.shade900 ? 0 : 3,
                  color: Colors.yellow.shade900)),
          backgroundColor: Colors.blue.shade300),
    );
  }
}

class AddToCartGrid extends StatelessWidget {
  final Item catalog;
  AddToCartGrid({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  //final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    //final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          //final _catalog = CatalogModel();
          // _cart.catalog = _catalog;//done before knowing vxstate
          // _cart.add(catalog);
          // isInCart = !isInCart;
          AddMutation(catalog);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(milliseconds: 1000),
              content: "Item Added Successfully".text.make()));
          //setState(() {});
        }
      },
      child: isInCart
          ? Row(
              children: [
                Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  color: Colors.yellow.shade900,
                ),
                " Added".text.white.bold.xl.make(),
              ],
            )
          : "Add To Cart".text.bold.white.make(),
      style: TextButton.styleFrom(
          shape: StadiumBorder(
              side: BorderSide(
                  width: context.cardColor == Colors.grey.shade900 ? 0 : 2,
                  color: Colors.yellow.shade900)),
          backgroundColor: Colors.blue.shade300),
    );
  }
}
