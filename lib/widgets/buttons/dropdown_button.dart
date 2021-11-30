import 'package:flutter/material.dart';

Widget dropdownButton({
  required String value,
  required String title,
  required List<String> options,
  required void Function(dynamic) onChanged,
  Widget Function(dynamic)? optionMapper,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title),
        DropdownButton(
          isExpanded: true,
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down),
          onChanged: onChanged,
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: optionMapper != null ? optionMapper(value) : Text(value),
            );
          }).toList(),
        ),
      ],
    ),
  );
}
