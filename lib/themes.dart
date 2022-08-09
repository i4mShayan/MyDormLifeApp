import 'package:flutter/material.dart';

class Themes{
  static final lightTheme = ThemeData(
    // scaffoldBackgroundColor: Colors.blueGrey[50],
    backgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(color: Colors.blue,),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.black,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.white),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.black),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    dividerColor: Colors.black,
  );

  static final darkTheme = ThemeData(
    // fontFamily: 'Verdana',
    scaffoldBackgroundColor: Colors.black,
    backgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(color: Colors.grey.shade900, elevation: 2),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.grey.shade900),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.white),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey[200],
      foregroundColor: Colors.black,
    ),
    cardColor: Colors.grey[900],
    dividerColor: Colors.white,
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.blue),
      trackColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.blue.withOpacity(0.5)),
    ),
  );
}