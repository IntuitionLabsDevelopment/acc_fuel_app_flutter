import 'package:flutter/material.dart';

Widget dropdownButton({
  required String value,
  required String title,
  required List<String> options,
  required void Function(dynamic) onChanged,
  Widget Function(dynamic)? optionMapper,
}) {
  return DropdownButton(
    isExpanded: true,
    value: value,
    icon: const Icon(Icons.keyboard_arrow_down),
    hint: Text(title),
    onChanged: onChanged,
    items: options.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: optionMapper != null ? optionMapper(value) : Text(value),
      );
    }).toList(),
  );
}
