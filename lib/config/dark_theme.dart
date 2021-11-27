import 'package:acc_fuel_app_flutter/utils/ui/button_styles.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.red[700],
  primarySwatch: Colors.red,
  fontFamily: 'Outfit',
  elevatedButtonTheme: ElevatedButtonThemeData(style: raisedButtonStyleDark),
  outlinedButtonTheme: OutlinedButtonThemeData(style: outlinedButtonStyleDark),
);
