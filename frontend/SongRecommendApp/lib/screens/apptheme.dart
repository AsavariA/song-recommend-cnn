import 'package:flutter/material.dart';

class AppTheme{
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.blueGrey,
    appBarTheme: AppBarTheme(
      color: Colors.blueGrey,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.blueGrey[600],
    appBarTheme: AppBarTheme(
      color: Colors.blueGrey[600],
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );
}