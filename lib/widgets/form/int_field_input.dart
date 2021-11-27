import 'package:acc_fuel_app_flutter/utils/helpers/form_field_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget intFieldInput(
    {required TextEditingController controller,
    required String labelText,
    required int maxLength,
    bool isRequired = true,
    bool isFinal = false,
    String hintText = ''}) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        counterText: "",
        hintText: hintText),
    validator: (value) {
      return validateFields(value, required: isRequired);
    },
    textInputAction: isFinal ? TextInputAction.done : TextInputAction.next,
    maxLength: maxLength,
  );
}
