import 'package:acc_fuel_app_flutter/widgets/calculate_button.dart';
import 'package:acc_fuel_app_flutter/widgets/save_button.dart';
import 'package:flutter/material.dart';

Widget calculatorScreen() {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            saveButton(onPressed: () {}),
            calculateButton(onPressed: () {}),
          ],
        )
      ],
    ),
  );
}
