// ignore_for_file: prefer_const_constructors, avoid_print, unused_local_variable, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'dart:convert';
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_flutter/core/store.dart';
import 'package:my_flutter/models/cart.dart';
import 'package:my_flutter/widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:my_flutter/models/catalog.dart';
import 'package:my_flutter/pages/home_detailpage.dart';
import 'package:my_flutter/utils/routes.dart';
import 'package:my_flutter/widgets/drawer.dart';
import '../main.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String name = "My App";
  bool viewType = true;
  final url = "https://api.jsonbin.io/b/61aaed1101558c731ccde502";

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    //noting to do with my code(done by system).
    super.initState();
    loadData();
  }

  loadData() async {
    //await Future.delayed(Duration(seconds: 5));
    // //this was done in order to test that catalogModel can't be null or empty
    //as the file stored was locally that's why it shown istantaneously as later setState(() {});
    //was called which reloades the data, but if data for eg was from net then it would have shown error
    //in android screen as well (not only in debug console), so dely was set so that we can see the error.

    //Done at the time of networking while using url
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");

    final response =
        await http.get(Uri.parse(url)); //done for using network url
    final catalogJson = response.body;

    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});

    //print(productData);
    //this was done to debug by doing breakdowns and check which value it is giving
    //for example here productData is giving map which we have to convert into value(here string)/
  }

//   @override
//   Widget build(BuildContext context) {
//     // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
//     //this was done when only one file is uploaded so that multiple files can be created and
//     //check as preview before actually adding files.
//     return Scaffold(
//       // backgroundColor: Colors.white,
//       //this is done if you want to give a background color (other than the parent color given at main.dart)
//       //to the whole home page.
//       appBar: AppBar(
//         title: Text(
//           "Happy Diwali 2021",
//         ),
//         // backgroundColor: Colors.teal,
//         // iconTheme: IconThemeData(color: Colors.yellow.shade900),
//         //this was done to give specific color other than primary color/theme to only app bar section only.
//       ),
//       body: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
//           //this ternary operator was addded later on in order to check the above
//           //dely of 5 seconds and also in current to avoid exception is data would have
//           //been from the net.
//           ? Container(
//               color: Colors.teal.shade50,
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//                 child: GridView.builder(
//                   itemCount: CatalogModel.items.length,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 16,
//                       crossAxisSpacing: 16),
//                   itemBuilder: (context, index) {
//                     final item = CatalogModel.items[index];
//                     return Card(
//                       clipBehavior: Clip.antiAlias,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5)),
//                       child: GridTile(
//                         child: Image.network(item.image),
//                         header: Container(
//                             decoration: BoxDecoration(
//                                 color: Colors.red.shade200,
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: Text(
//                               item.name,
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold),
//                             )),
//                         footer: Container(
//                             decoration: BoxDecoration(
//                                 color: Colors.lime.shade200,
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: Text(
//                               "\$" + item.price.toString(),
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold),
//                             )),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             )
//           //  Padding(
//           //     padding: const EdgeInsets.symmetric(vertical: 15),
//           //     child: ListView.builder(
//           //       itemCount: CatalogModel.items.length,
//           //       // itemCount: dummyList.length,
//           //       //this was done at the time of dummy test.
//           //       itemBuilder: (context, index) {
//           //         return ItemWidget(
//           //           item: CatalogModel.items[index],
//           //         );
//           //       },
//           //     ),
//           //   )
//           : Center(child: CircularProgressIndicator()),
//       //  Center(
//       //   child: Text(
//       //     "Welcome to $name",
//       //     style: TextStyle(
//       //       fontSize: 30,
//       //       color: Colors.amber,
//       //       fontStyle: FontStyle.italic,
//       //       fontWeight: FontWeight.bold,
//       //     ),
//       //   ),
//       // ),
//       //this was done at very initial stage in order to test how a text is
//       //added to the home screen.
//       drawer: MyDrawer(),
//     );
//   }
// }
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor:
          // Theme.of(context).canvasColor,
          context.theme.errorColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, store, status) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.cartRoute);
            },
            child: Container(
              padding: Vx.m8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.theme.buttonColor,
              ),
              child: Icon(
                CupertinoIcons.cart_fill,
                size: 45,
                color: context.theme.hintColor,
              ).p4(),
            ),
          ).badge(
              size: 22,
              count: _cart.items.length,
              textStyle: TextStyle(
                  color: context.theme.focusColor,
                  fontWeight: FontWeight.bold));
        },
      ),
      appBar: AppBar(
        title: "Catalog".text.xl5.teal900.bold.make(),
        elevation: 0,
        backgroundColor: context.theme.errorColor,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                viewType == false ? viewType = true : viewType = false;
              });
            },
            icon: Icon(
              viewType == false
                  ? CupertinoIcons.square_grid_2x2_fill
                  : CupertinoIcons.rectangle_grid_1x2_fill,
              color: context.theme.hintColor,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              currentTheme.toggleTheme();
            },
            icon: Icon(
              context.cardColor == Colors.grey.shade900
                  ? CupertinoIcons.moon_stars
                  : CupertinoIcons.sun_max_fill,
              color: context.theme.hintColor,
              size: 30,
            ),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: SafeArea(
        child: Container(
          padding: Vx.mH8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                viewType == false
                    ? CatalogGrid().expand()
                    : CatalogList().expand()
              else
                CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //"Catalog App".text.xl5.teal900.bold.make(),
        "Products".text.xl2.color(Colors.red).bold.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetailPage(catalog: catalog),
                    ));
              },
              child: CatalogItem(catalog: catalog));
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            catalog.name.text.xl2.bold.make().px8(),
            catalog.desc.text.make().px2(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price}".text.bold.xl2.make(),
                AddToCartList(catalog: catalog)
              ],
            ),
          ],
        )),
      ],
    )).color(context.theme.accentColor).rounded.square(160).make().py8().px2();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image})
      : assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .square(150)
        .color(context.canvasColor)
        .p8
        .rounded
        .make()
        .p8();
  }
}

class CatalogGridImage extends StatelessWidget {
  final String image;

  const CatalogGridImage({Key? key, required this.image})
      : assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .square(120)
        .color(context.canvasColor)
        .p0
        .rounded
        .make()
        .p16();
  }
}

class CatalogGrid extends StatelessWidget {
  const CatalogGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      staggeredTileBuilder: (index) => StaggeredTile.count(1, 1.6),
      crossAxisCount: 2,
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog),
                  ));
            },
            child: CatalogItemGrid(catalog: catalog));
      },
    );
  }
}

class CatalogItemGrid extends StatelessWidget {
  final Item catalog;

  const CatalogItemGrid({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Column(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogGridImage(image: catalog.image)),
          Expanded(
              child: Column(
            children: [
              catalog.name.text.xl.bold.make().px8(),
              catalog.desc.text.align(TextAlign.center).make().px2(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                children: [
                  "\$${catalog.price}".text.bold.make(),
                  AddToCartGrid(catalog: catalog)
                ],
              ),
            ],
          ))
        ],
      ),
    ).color(context.theme.accentColor).rounded.make().px4().py8();
  }
}
