import 'package:acc_fuel_app_flutter/widgets/form/lap_time_input.dart';
import 'package:acc_fuel_app_flutter/widgets/form/litres_per_lap_input.dart';
import 'package:acc_fuel_app_flutter/widgets/form/stint_length_input.dart';
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

  /* TODO: CREATE ON CHANGED FUNCTION FOR EACH FIELD THAT CHECKS IF ALL INPUTS FULFILLED THEN CALCULATE */

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _calculatorFormKey,
      child: Column(
        children: <Widget>[
          lapTimeFields(),
          Row(
            children: [
              Expanded(flex: 1, child: litresPerLapField()),
              const Padding(padding: EdgeInsets.only(right: 10)),
              Expanded(flex: 1, child: stintLengthField()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              saveButton(onPressed: () {}),
              calculateButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_calculatorFormKey.currentState!.validate()) {
                    /* CALCULATE FUEL */
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(minInput.text)),
                    );
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
