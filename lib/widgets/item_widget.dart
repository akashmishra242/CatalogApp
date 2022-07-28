// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:my_flutter/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Card(
        child: ListTile(
          leading: Image.network(item.image),
          title: Text(
            item.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$${item.price}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red.shade600,
                fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
