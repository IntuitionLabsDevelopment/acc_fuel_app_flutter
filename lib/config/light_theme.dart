import 'package:acc_fuel_app_flutter/core/styles/button_styles.dart';
import 'package:acc_fuel_app_flutter/core/styles/checkbox_styles.dart';
import 'package:acc_fuel_app_flutter/core/styles/switch_styles.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red[600],
    primarySwatch: Colors.red,
    fontFamily: 'Outfit',
    elevatedButtonTheme: ElevatedButtonThemeData(style: raisedButtonStyleLight),
    outlinedButtonTheme:
        OutlinedButtonThemeData(style: outlinedButtonStyleLight),
    checkboxTheme: checkboxStyleLight,
    switchTheme: switchStyleLight);
