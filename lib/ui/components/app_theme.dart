import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  // final primaryColor = Color.fromRGBO(136, 14, 79, 1);
  // final primaryColorDark = Color.fromRGBO(96, 0, 39, 1);
  // final primaryColorLight = Color.fromRGBO(188, 71, 123, 1);

  final primaryColor01 = Color.fromRGBO(15, 24, 34, 1);
  final primaryColor02 = Color.fromRGBO(38, 38, 38, 1);
  // final primaryColor03 = Color.fromRGBO(67, 67, 67, 1);
  final primaryColor04 = Color.fromRGBO(135, 135, 135, 1);
  final primaryColor05 = Color.fromRGBO(233, 234, 213, 1);

  final primaryColor = primaryColor01;
  final primaryColorDark = primaryColor02;
  final primaryColorLight = primaryColor04;

  final backgroundColor = primaryColor05;

  return ThemeData(
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: primaryColor,
        ),
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    accentColor: primaryColor,
    backgroundColor: backgroundColor,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 38,
        fontWeight: FontWeight.bold,
        color: primaryColorDark,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColorLight),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColorDark),
      ),
      alignLabelWithHint: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 100,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
}
