import 'package:acc_fuel_app_flutter/utils/ui/button_styles.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.red[600],
  primarySwatch: Colors.red,
  fontFamily: 'Outfit',
  elevatedButtonTheme: ElevatedButtonThemeData(style: raisedButtonStyleLight),
  outlinedButtonTheme: OutlinedButtonThemeData(style: outlinedButtonStyleLight),
);
