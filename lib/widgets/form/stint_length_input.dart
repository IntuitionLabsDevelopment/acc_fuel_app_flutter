import 'package:acc_fuel_app_flutter/widgets/form/fields_section.dart';
import 'package:acc_fuel_app_flutter/widgets/form/int_field_input.dart';
import 'package:acc_fuel_app_flutter/widgets/form/text_filler.dart';
import 'package:flutter/material.dart';

final TextEditingController stintHourInput = TextEditingController();
final TextEditingController stintMinInput = TextEditingController();

Widget stintLengthField() {
  return fieldsSection('Stint Length', [
    Expanded(
        flex: 1,
        child: intFieldInput(
            controller: stintHourInput,
            labelText: 'hr',
            maxLength: 2,
            isRequired: false,
            hintText: '0')),
    formTextFiller(' : '),
    Expanded(
        flex: 1,
        child: intFieldInput(
            controller: stintMinInput,
            labelText: 'min',
            maxLength: 3,
            isRequired: true)),
  ]);
}
