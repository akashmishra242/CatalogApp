// ignore_for_file: non_constant_identifier_names, deprecated_member_use, unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData LightTheme(BuildContext context) => ThemeData(
        // primarySwatch: Colors.teal,
        cardColor:
            Colors.lime.shade100, // i have used it for primary background color
        canvasColor: Colors.red
            .shade200, // i have used it for secondary(main) background color
        accentColor: Colors.red[
            100], // i have used this color for seconaday(contrast)background color
        hintColor: Colors.black, //i have used it for changing icon color
        buttonColor:
            Colors.red.shade300, // i have used it for changing container color
        errorColor: Colors.lime.shade200, //for my satisfaction
        focusColor: Colors.black, //done for black and white text swap
        hoverColor: Colors.white, //done for white and black switch
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black, size: 35),
        ),
        primaryTextTheme: GoogleFonts.latoTextTheme(),
      );

  static ThemeData DarkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        cardColor:
            Colors.grey[900], // i have used it for primary background color
        canvasColor: Colors
            .grey.shade800, // i have used it for secondary background color
        accentColor: Colors.grey
            .shade600, // i have used this color for seconaday(contrast)background color
        hintColor:
            Colors.teal.shade900, //i have used it for changing icon color
        buttonColor:
            Colors.black, // i have used it for changing container color
        errorColor: Colors.grey.shade900, //for my satisfaction
        focusColor: Colors.white, //done for black and white text swap
        hoverColor: Colors.grey.shade600, //done for white and black switch
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white, size: 35),
        ),
        //primaryTextTheme: GoogleFonts.latoTextTheme(),
      );
}
