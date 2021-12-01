import 'package:acc_fuel_app_flutter/widgets/form/fields_section.dart';
import 'package:acc_fuel_app_flutter/widgets/form/input_options.dart';
import 'package:acc_fuel_app_flutter/widgets/form/text_filler.dart';
import 'package:acc_fuel_app_flutter/widgets/form/int_field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final TextEditingController minInput = TextEditingController();
final TextEditingController secInput = TextEditingController();
final TextEditingController msInput = TextEditingController();

Widget lapTimeFields() {
  return ValueListenableBuilder(
      valueListenable: usingStintNotifier,
      builder: (BuildContext context, bool isUsingStint, Widget? child) {
        return fieldsSection(AppLocalizations.of(context)!.lapTime, [
          Expanded(
              child: intFieldInput(
                  controller: minInput,
                  labelText: 'min',
                  maxLength: 2,
                  isRequired: isUsingStint)),
          formTextFiller(' : '),
          Expanded(
              child: intFieldInput(
                  controller: secInput,
                  labelText: 'sec',
                  maxLength: 2,
                  isRequired: isUsingStint)),
          formTextFiller(' . '),
          Expanded(
              child: intFieldInput(
                  controller: msInput,
                  labelText: 'ms',
                  maxLength: 3,
                  isRequired: false,
                  hintText: '000')),
        ]);
      });
}
