import 'package:acc_fuel_app_flutter/core/styles/material_state_colors.dart';
import 'package:flutter/material.dart';

final SwitchThemeData switchStyleDark = SwitchThemeData(
  thumbColor: MaterialStateProperty.resolveWith(getStateOnFillColorDark),
  trackColor: MaterialStateProperty.resolveWith(getStateFillColorDark),
);

final SwitchThemeData switchStyleLight = SwitchThemeData(
  thumbColor: MaterialStateProperty.resolveWith(getStateOnFillColorLight),
  trackColor: MaterialStateProperty.resolveWith(getStateFillColorLight),
);
