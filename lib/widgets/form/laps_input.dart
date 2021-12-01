import 'package:acc_fuel_app_flutter/widgets/form/fields_section.dart';
import 'package:acc_fuel_app_flutter/widgets/form/input_options.dart';
import 'package:acc_fuel_app_flutter/widgets/form/int_field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final TextEditingController lapsInput = TextEditingController();

Widget lapsInputField() {
  return ValueListenableBuilder(
      valueListenable: usingStintNotifier,
      builder: (BuildContext context, bool isUsingStint, Widget? child) {
        return fieldsSection(AppLocalizations.of(context)!.laps, [
          Expanded(
              child: intFieldInput(
                  controller: lapsInput,
                  labelText: 'laps',
                  maxLength: 4,
                  isRequired: !isUsingStint,
                  isFinal: true)),
        ]);
      });
}
