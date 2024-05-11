import 'package:acc_fuel_app_flutter/utils/helpers/calculate_fuel.dart';
import 'package:acc_fuel_app_flutter/utils/services/local_storage_service.dart';
import 'package:acc_fuel_app_flutter/utils/ui/app_toasts.dart';
import 'package:acc_fuel_app_flutter/widgets/form/input_options.dart';
import 'package:acc_fuel_app_flutter/widgets/form/lap_time_input.dart';
import 'package:acc_fuel_app_flutter/widgets/form/laps_input.dart';
import 'package:acc_fuel_app_flutter/widgets/form/litres_per_lap_input.dart';
import 'package:acc_fuel_app_flutter/widgets/form/stint_length_input.dart';
import 'package:acc_fuel_app_flutter/widgets/selections_section.dart';
import 'package:flutter/material.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/calculate_button.dart';
import 'package:acc_fuel_app_flutter/widgets/buttons/save_button.dart';

// Define a custom Form widget.
class CalculatorForm extends StatefulWidget {
  const CalculatorForm({Key? key}) : super(key: key);

  @override
  CalculatorFormState createState() {
    return CalculatorFormState();
  }
}

class CalculatorFormState extends State<CalculatorForm> {
  final _calculatorFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _calculatorFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          inputOptionsFields(context),
          ValueListenableBuilder(
              valueListenable: usingStintNotifier,
              builder:
                  (BuildContext context, bool isUsingStint, Widget? child) {
                return Visibility(
                  visible: isUsingStint,
                  child: lapTimeFields(),
                );
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: litresPerLapField()),
              const Padding(padding: EdgeInsets.only(right: 10)),
              Expanded(
                child: ValueListenableBuilder(
                    valueListenable: usingStintNotifier,
                    builder: (BuildContext context, bool isUsingStint,
                        Widget? child) {
                      return Visibility(
                        replacement: lapsInputField(),
                        visible: isUsingStint,
                        child: stintLengthField(),
                      );
                    }),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              saveButton(context, onPressed: () {
                if (litresInput.text != '') {
                  try {
                    saveCalcInputs(
                        tracksNotifier.value,
                        carNotifier.value,
                        conditionsNotifier.value,
                        double.parse(litresInput.text),
                        minInput.text != '' ? int.parse(minInput.text) : null,
                        secInput.text != '' ? int.parse(secInput.text) : null,
                        msInput.text != '' ? int.parse(msInput.text) : null);
                    successToast(context);
                  } catch (e) {
                    errorToast(context);
                  }
                }
              }),
              calculateButton(
                context,
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_calculatorFormKey.currentState!.validate()) {
                    /* CALCULATE FUEL */
                    calculateFuel();
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
