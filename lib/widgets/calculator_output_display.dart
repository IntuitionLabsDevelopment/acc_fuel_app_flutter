import 'package:acc_fuel_app_flutter/utils/helpers/calculate_fuel.dart';
import 'package:acc_fuel_app_flutter/widgets/calculator_output_section.dart';
import 'package:acc_fuel_app_flutter/widgets/form/input_options.dart';
import 'package:acc_fuel_app_flutter/widgets/unit_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget calculatorOutputDisplay(BuildContext context) {
  return ValueListenableBuilder(
      valueListenable: usingStintNotifier,
      builder: (BuildContext context, bool usingStint, Widget? child) {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 70),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: Theme.of(context).highlightColor),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ValueListenableBuilder(
                    valueListenable: riskyFuelNotifier,
                    builder:
                        (BuildContext context, int riskyFuel, Widget? child) {
                      return ValueListenableBuilder(
                          valueListenable: unitNotifier,
                          builder: (BuildContext context,
                              Map<String, String> units, Widget? child) {
                            return Expanded(
                                child: calculatorOutputSection(
                              title: AppLocalizations.of(context)!.riskyFuel,
                              value: riskyFuel.toString() + units['short']!,
                            ));
                          });
                    }),
                Container(
                    width: 2,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Theme.of(context).highlightColor),
                    )),
                ValueListenableBuilder(
                    valueListenable: safeFuelNotifier,
                    builder:
                        (BuildContext context, int safeFuel, Widget? child) {
                      return ValueListenableBuilder(
                          valueListenable: unitNotifier,
                          builder: (BuildContext context,
                              Map<String, String> units, Widget? child) {
                            return Expanded(
                                child: calculatorOutputSection(
                              title: AppLocalizations.of(context)!.safeFuel,
                              value: safeFuel.toString() + units['short']!,
                            ));
                          });
                    }),
                Visibility(
                  visible: usingStint,
                  child: Container(
                      width: 2,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Theme.of(context).highlightColor),
                      )),
                ),
                Visibility(
                  visible: usingStint,
                  child: ValueListenableBuilder(
                      valueListenable: estimatedLapsNotifier,
                      builder: (BuildContext context, int estimatedLaps,
                          Widget? child) {
                        return Expanded(
                            child: calculatorOutputSection(
                          title: AppLocalizations.of(context)!.estLaps,
                          value: estimatedLaps.toString(),
                        ));
                      }),
                ),
              ],
            ),
          ),
        );
      });
}
