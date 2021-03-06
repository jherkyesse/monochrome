import 'package:flutter/material.dart';
import 'colors.dart';

final ThemeData lightTheme = buildLightTheme();

ThemeData buildLightTheme() {
  final ThemeData theme = ThemeData.light();

  return theme.copyWith(
      primaryColor: black3a,
      primaryColorLight: black9,
      primaryColorDark: black1,
      buttonColor: black9,
      canvasColor: white,
      accentColor: whitef8,
      bottomAppBarTheme: BottomAppBarTheme(color: whitef8, elevation: 0.0),
      bottomAppBarColor: whiteec,
      cardColor: whiteec,
      unselectedWidgetColor: black7,
      selectedRowColor: black7,
      toggleableActiveColor: black7,
      dividerColor: whiteec,
      splashColor: white,
      secondaryHeaderColor: white);
}

final ThemeData darkTheme = buildDarkTheme();

ThemeData buildDarkTheme() {
  final ThemeData theme = ThemeData.dark();
  return theme.copyWith(
      primaryColor: black3a,
      primaryColorLight: black9,
      primaryColorDark: black1,
      buttonColor: black9,
      canvasColor: white,
      accentColor: whitef8,
      bottomAppBarTheme: BottomAppBarTheme(color: whitef8, elevation: 0.0),
      bottomAppBarColor: whiteec,
      cardColor: whiteec,
      unselectedWidgetColor: black7,
      selectedRowColor: black7,
      toggleableActiveColor: black7,
      dividerColor: whiteec,
      splashColor: white,
      secondaryHeaderColor: white);
}
