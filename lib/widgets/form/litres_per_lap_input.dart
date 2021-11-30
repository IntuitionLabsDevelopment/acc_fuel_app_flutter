import 'package:acc_fuel_app_flutter/widgets/form/double_field_input.dart';
import 'package:acc_fuel_app_flutter/widgets/form/fields_section.dart';
import 'package:acc_fuel_app_flutter/widgets/unit_switch.dart';
import 'package:flutter/material.dart';

final TextEditingController litresInput = TextEditingController();

Widget litresPerLapField() {
  return ValueListenableBuilder(
      valueListenable: unitNotifier,
      builder:
          (BuildContext context, Map<String, String> units, Widget? child) {
        return fieldsSection(units['long']! + ' Per Lap', [
          Expanded(
              child: doubleFieldInput(
                  controller: litresInput,
                  labelText: units['short']!,
                  maxLength: 5)),
        ]);
      });
}
