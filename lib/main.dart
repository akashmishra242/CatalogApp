// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_flutter/core/store.dart';
import 'package:my_flutter/pages/cart_page.dart';
import 'package:my_flutter/pages/home_page.dart';
import 'package:my_flutter/pages/login_page.dart';
import 'package:my_flutter/utils/routes.dart';
import 'package:my_flutter/widgets/theme.dart';

// ignore: unused_import
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.light,
      // theme: MyTheme.LightTheme(context),
      // darkTheme: MyTheme.DarkTheme(context),
      theme: CustomTheme._isDarkTheme == false
          ? MyTheme.LightTheme(context)
          : MyTheme.DarkTheme(context),

      debugShowCheckedModeBanner: false,
      // initialRoute: MyRoutes.loginRoute,
      routes: {
        // "/": (context) => HomePage(),
        // "/": (context) => LoginPage(),
        // "/home": (context) => HomePage(),
        // "/login": (context) => LoginPage(),

        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
