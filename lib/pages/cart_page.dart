// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/core/store.dart';
import 'package:my_flutter/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:my_flutter/widgets/theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.cardColor,
        elevation: 0,
        title: "Cart".text.color(context.theme.focusColor).xl5.bold.make(),
      ),
      backgroundColor: Theme.of(context).cardColor,
      bottomNavigationBar: _CartTotal(),
      body: Column(
        children: [
          _CartList().p16().expand(),
          //Divider(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //VxState.watch(context, on: [AddMutation, RemoveMutation]);
    //WE will not prefer this as it will build whole class but we want some specific
    //thing to get refreshed only.
    // final _cart = new CartModel();
    final CartModel _cart = (VxState.store as MyStore).cart;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: context.canvasColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VxConsumer(
            //we can use VxBilder,Vxnotifier also intead of this.
            mutations: {RemoveMutation},
            notifications: {},
            builder: (BuildContext context, store, VxStatus? status) {
              return "\$${_cart.totalPrice}".text.xl5.make();
            },
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(milliseconds: 1000),
                  content: "This Option Will Be Available Soon".text.make()));
            },
            child: "Buy Now".text.xl2.make(),
            style: TextButton.styleFrom(
              padding: Vx.mSymmetric(h: 12, v: 12),
              backgroundColor: Colors.blue.shade300,
              shape: const StadiumBorder(
                  side: BorderSide(width: 3, color: Colors.black)),
            ),
          ),
        ],
      ).p4(),
    );
  }
}

class _CartList extends StatelessWidget {
  // final _cart = new CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl4.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  size: 25,
                  color: Colors.yellow.shade900,
                ),
                title: _cart.items[index].name.text.make(),
                trailing: IconButton(
                  onPressed: () {
                    // _cart.remove(_cart.items[index]);
                    RemoveMutation(_cart.items[index]);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(milliseconds: 1000),
                        content: "Item Removed Successfully".text.make()));
                    //setState(() {});
                  },
                  icon: Icon(CupertinoIcons.minus_circled),
                ),
              );
            },
          );
  }
}
