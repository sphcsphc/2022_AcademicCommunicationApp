import 'package:flutter/material.dart';

var theme = ThemeData(
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: TextStyle(fontSize: 18)
    )
  ),
  appBarTheme: AppBarTheme(
    color : Colors.white,
    elevation: 1,
    titleTextStyle: TextStyle(color:Colors.black, fontSize: 25),
    actionsIconTheme: IconThemeData(color:Colors.black),
  ),
  textTheme: TextTheme(
    bodyText2: TextStyle(color: Colors.black, fontSize: 15)
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: Colors.white,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.black,
  )
);