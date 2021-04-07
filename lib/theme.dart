import 'package:flutter/material.dart';

Color textColor = Colors.white;

ThemeData darkTheme = ThemeData(
  primaryColor: Colors.black,
  canvasColor: Colors.transparent,
  splashColor: Colors.pink[400],
  accentColor: Colors.pink[300],
  focusColor: Colors.pink[200],
  textTheme: TextTheme(
    headline1: TextStyle(color: textColor),
    subtitle1: TextStyle(color: textColor),
    bodyText1: TextStyle(color: textColor),
    bodyText2: TextStyle(color: textColor),
  ),
);
