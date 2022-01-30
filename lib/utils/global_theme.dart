import 'package:flutter/material.dart';

//final fPrimaryColor - Colors.red;

ThemeData globalTheme() => ThemeData(
  fontFamily: 'Georgia',
  splashColor: Colors.cyanAccent,

  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: Colors.purple,
  ).copyWith(
    secondary: Colors.purpleAccent,
  ),

  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 22.0, fontStyle: FontStyle.italic),
    headline5: TextStyle(fontSize: 24.0, color: Colors.purple),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.deepPurple),
  ),
);