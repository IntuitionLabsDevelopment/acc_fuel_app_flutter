import 'package:acc_fuel_app_flutter/modules/forms/calculator_form.dart';

import 'package:flutter/material.dart';

Widget calculatorScreen() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          CalculatorForm(),
        ],
      ),
    ),
  );
}
