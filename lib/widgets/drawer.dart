// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  final imageUrl =
      "https://media-exp1.licdn.com/dms/image/D5603AQHZkK3vHOsyyQ/profile-displayphoto-shrink_800_800/0/1635344137606?e=1641427200&v=beta&t=hlnh_4IT9hfUXnVHmH-P-B0jezM09fG-D33dxyIAiwg";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: context.cardColor,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: context.canvasColor,
                ),
                accountName: Text(
                  "Akash Mishra",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text("akashmishra242@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.yellow.shade900,
                size: 35,
              ),
              title: Text(
                "My Profile",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.bag,
                color: Colors.yellow.shade900,
                size: 35,
              ),
              title: Text(
                "Wishlist",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: Colors.yellow.shade900,
                size: 35,
              ),
              title: Text(
                "Setting",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.globe,
                color: Colors.yellow.shade900,
                size: 35,
              ),
              title: Text(
                "Language",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.question_circle_fill,
                color: Colors.yellow.shade900,
                size: 35,
              ),
              title: Text(
                "Help & Support",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.power,
                color: Colors.yellow.shade900,
                size: 35,
              ),
              title: Text(
                "Logout",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
