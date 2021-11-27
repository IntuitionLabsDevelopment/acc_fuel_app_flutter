import 'package:acc_fuel_app_flutter/widgets/form_text_filler.dart';
import 'package:acc_fuel_app_flutter/widgets/int_field_input.dart';
import 'package:flutter/material.dart';

final TextEditingController minInput = TextEditingController();
final TextEditingController secInput = TextEditingController();
final TextEditingController msInput = TextEditingController();

Widget lapTimeFields() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
          flex: 1,
          child: intFieldInput(
              controller: minInput, labelText: 'min', maxLength: 1)),
      formTextFiller(' : '),
      Expanded(
          flex: 1,
          child: intFieldInput(
              controller: secInput, labelText: 'sec', maxLength: 2)),
      formTextFiller(' . '),
      Expanded(
          flex: 1,
          child: intFieldInput(
              controller: msInput,
              labelText: 'ms',
              maxLength: 3,
              isRequired: false,
              hintText: '000')),
    ],
  );
}
