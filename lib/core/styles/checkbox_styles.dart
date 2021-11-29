import 'package:acc_fuel_app_flutter/core/styles/material_state_colors.dart';
import 'package:flutter/material.dart';

final CheckboxThemeData checkboxStyleDark = CheckboxThemeData(
  checkColor: MaterialStateProperty.resolveWith(getStateOnFillColorDark),
  fillColor: MaterialStateProperty.resolveWith(getStateFillColorDark),
);

final CheckboxThemeData checkboxStyleLight = CheckboxThemeData(
  checkColor: MaterialStateProperty.resolveWith(getStateOnFillColorLight),
  fillColor: MaterialStateProperty.resolveWith(getStateFillColorLight),
);
