import 'package:flutter/material.dart';

var theme = ThemeData(
  appBarTheme: AppBarTheme(
    color : Colors.white,
    elevation: 1,
    titleTextStyle: TextStyle(color:Colors.black, fontSize: 25),
    actionsIconTheme: IconThemeData(color: Colors.black, size: 30)
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: TextStyle(fontSize: 18)
    )
  ),
  textTheme: TextTheme(
    bodyText2: TextStyle(color: Colors.black, fontSize: 15)
  )
);
