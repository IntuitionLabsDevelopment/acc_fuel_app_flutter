import 'package:acc_fuel_app_flutter/widgets/form/fields_section.dart';
import 'package:acc_fuel_app_flutter/widgets/form/text_filler.dart';
import 'package:acc_fuel_app_flutter/widgets/form/int_field_input.dart';
import 'package:flutter/material.dart';

final TextEditingController minInput = TextEditingController();
final TextEditingController secInput = TextEditingController();
final TextEditingController msInput = TextEditingController();

Widget lapTimeFields() {
  return fieldsSection('Lap Time', [
    Expanded(
        child: intFieldInput(
            controller: minInput, labelText: 'min', maxLength: 2)),
    formTextFiller(' : '),
    Expanded(
        child: intFieldInput(
            controller: secInput, labelText: 'sec', maxLength: 2)),
    formTextFiller(' . '),
    Expanded(
        child: intFieldInput(
            controller: msInput,
            labelText: 'ms',
            maxLength: 3,
            isRequired: false,
            hintText: '000')),
  ]);
}
