import 'package:acc_fuel_app_flutter/widgets/buttons/selections_button.dart';
import 'package:flutter/material.dart';

Widget calculatorSelectionsSection() {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        selectionsButton(onPressed: () {
          /* OPEN SELECTIONS DIALOG */
        })
      ],
    ),
  );
}
