// ignore_for_file: unnecessary_null_comparison, unused_import, prefer_const_constructors

//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_flutter/models/catalog.dart';
import 'package:my_flutter/pages/home_page.dart';
import 'package:my_flutter/widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.cardColor,
      ),
      bottomNavigationBar: Container(
        color: context.canvasColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl4.make(),
            // ElevatedButton(
            //   onPressed: null,
            //   child: "Add To Cart".text.white.bold.xl2.make().px4().py8(),
            //   style: TextButton.styleFrom(
            //       shape: StadiumBorder(
            //           side: BorderSide(width: 3, color: Colors.black)),
            //       backgroundColor: Colors.blue.shade300),
            // )
            AddToCartList(
              catalog: catalog,
            ).py4().h8(context),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 1000),
                    content: "This Option Will Be Available Soon".text.make()));
              },
              child: "Buy Now".text.white.bold.xl2.make().px4().py8(),
              style: TextButton.styleFrom(
                  shape: StadiumBorder(
                      side: BorderSide(width: 3, color: Colors.black)),
                  backgroundColor: Colors.blue.shade300),
            ).py4().h8(context),
          ],
        ),
      ),
      backgroundColor: context.cardColor,
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image)
                        .centered()
                        .h32(context)
                        .wFull(context))
                .px12(),
            Expanded(
                child: VxArc(
              height: 30,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.canvasColor,
                child: Column(children: [
                  catalog.name.text.xl5.bold.make(),
                  catalog.desc.text.xl.bold.make(),
                  "Sed et sit vero kasd diam. Labore dolor duo rebum eos amet tempor erat. Labore no ipsum at dolores, invidunt."
                      .text
                      .center
                      .xl
                      .make()
                      .py24()
                      .px12(),
                ]).wFull(context).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
