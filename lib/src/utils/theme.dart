import 'package:flutter/material.dart';
import 'package:tempest/src/utils/widgetThemes/text_fieldThemes.dart';
import 'package:tempest/src/utils/widgetThemes/text_themes.dart';

class Mytheme {
  Mytheme._();

  static ThemeData lightTheme = ThemeData(
      //useMaterial3: true,
      primarySwatch: Colors.blue,
      accentColor: Colors.blue[100],
      brightness: Brightness.light,
      textTheme: MyTextTheme.lightTextTheme,
      inputDecorationTheme: TextFieldformTheme.lightInputDecorationTheme);
  static ThemeData darkTheme = ThemeData(
      //useMaterial3: true,
      accentColor: Colors.grey.shade600,
      brightness: Brightness.dark,
      textTheme: MyTextTheme.darkTextTheme,
      inputDecorationTheme: TextFieldformTheme.darkInputDecorationTheme);
}
