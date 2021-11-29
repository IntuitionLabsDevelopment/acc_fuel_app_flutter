import 'package:flutter/material.dart';

Color getStateFillColorDark(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
    MaterialState.selected
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.red[700] as Color;
  }
  return Colors.grey;
}

Color getStateFillColorLight(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
    MaterialState.selected
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.red[600] as Color;
  }
  return Colors.grey;
}

Color getStateOnFillColorDark(Set<MaterialState> states) {
  return Colors.white70;
}

Color getStateOnFillColorLight(Set<MaterialState> states) {
  return Colors.white;
}
