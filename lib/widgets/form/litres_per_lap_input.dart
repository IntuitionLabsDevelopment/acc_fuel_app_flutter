import 'package:acc_fuel_app_flutter/widgets/form/double_field_input.dart';
import 'package:acc_fuel_app_flutter/widgets/form/fields_section.dart';
import 'package:flutter/material.dart';

final TextEditingController litresInput = TextEditingController();

Widget litresPerLapField() {
  return fieldsSection('Litres Per Lap', [
    Expanded(
        flex: 1,
        child: doubleFieldInput(
            controller: litresInput, labelText: 'L', maxLength: 5)),
  ]);
}
