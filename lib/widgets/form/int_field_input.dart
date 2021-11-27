import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String? validateIntFields(String? value, {bool required = true}) {
  if (required) {
    if (value == null || value.isEmpty) {
      return 'Please enter value';
    }
  } else if (value == '') {
    return null;
  }

  if (value != null && int.parse(value) < 0) {
    return 'Cannot be negative';
  }
  return null;
}

Widget intFieldInput(
    {required TextEditingController controller,
    required String labelText,
    required int maxLength,
    bool isRequired = true,
    String hintText = ''}) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        hintText: hintText),
    validator: (value) {
      return validateIntFields(value, required: isRequired);
    },
    textInputAction: TextInputAction.next,
    maxLength: maxLength,
  );
}
