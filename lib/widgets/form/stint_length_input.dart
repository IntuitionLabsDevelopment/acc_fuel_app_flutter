import 'package:acc_fuel_app_flutter/widgets/form/fields_section.dart';
import 'package:acc_fuel_app_flutter/widgets/form/input_options.dart';
import 'package:acc_fuel_app_flutter/widgets/form/int_field_input.dart';
import 'package:acc_fuel_app_flutter/widgets/form/text_filler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final TextEditingController stintHourInput = TextEditingController();
final TextEditingController stintMinInput = TextEditingController();

Widget stintLengthField() {
  return ValueListenableBuilder(
      valueListenable: usingStintNotifier,
      builder: (BuildContext context, bool isUsingStint, Widget? child) {
        return fieldsSection(AppLocalizations.of(context)!.stintLength, [
          Expanded(
              child: intFieldInput(
                  controller: stintHourInput,
                  labelText: 'hr',
                  maxLength: 2,
                  isRequired: false,
                  hintText: '0')),
          formTextFiller(' : '),
          Expanded(
              child: intFieldInput(
                  controller: stintMinInput,
                  labelText: 'min',
                  maxLength: 3,
                  isRequired: isUsingStint,
                  isFinal: true)),
        ]);
      });
}
