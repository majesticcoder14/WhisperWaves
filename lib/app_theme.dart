import 'package:flutter/material.dart';

final ThemeData climateAppTheme = ThemeData(
  primaryColor: Colors.blue,
  accentColor: Colors.green,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.blue, // Titles in blue
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    bodyText1: TextStyle(
      color: Colors.black, // Regular text in black
      fontSize: 16,
    ),
    bodyText2: TextStyle(
      color: Colors.grey, // Subdued text in grey
      fontSize: 14,
    ),
  ),
  appBarTheme: AppBarTheme(
    color: Colors.green, // App bar in green
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue, // Buttons in blue
    textTheme: ButtonTextTheme.primary,
  ),
);
