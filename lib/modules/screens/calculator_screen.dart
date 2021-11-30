import 'package:acc_fuel_app_flutter/modules/forms/calculator_form.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/clear_data_button.dart';
import 'package:acc_fuel_app_flutter/widgets/calculator_output_display.dart';
import 'package:acc_fuel_app_flutter/widgets/selections_section.dart';

import 'package:flutter/material.dart';

Widget calculatorScreen(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          calculatorOutputDisplay(context),
          const CalculatorForm(),
          calculatorSelectionsSection(context),
          clearDataButton()
        ],
      ),
    ),
  );
}
