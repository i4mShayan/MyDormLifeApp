import 'package:flutter/material.dart';

class Themes{
  static final lightTheme = ThemeData(
    // scaffoldBackgroundColor: Colors.blueGrey[50],
    backgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(foregroundColor: Colors.black),
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
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.white),
      fillColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.black),
    ),
  );

  static final darkTheme = ThemeData(
    // fontFamily: 'Verdana',
    scaffoldBackgroundColor: Colors.black,
    backgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(foregroundColor: Colors.white),
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
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.black),
      fillColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.white),
    ),
  );
}