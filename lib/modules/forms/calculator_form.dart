import 'package:acc_fuel_app_flutter/widgets/lap_time_input.dart';
import 'package:flutter/material.dart';
import 'package:acc_fuel_app_flutter/widgets/calculate_button.dart';
import 'package:acc_fuel_app_flutter/widgets/save_button.dart';

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
        children: <Widget>[
          lapTimeFields(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              saveButton(onPressed: () {}),
              calculateButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_calculatorFormKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
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
