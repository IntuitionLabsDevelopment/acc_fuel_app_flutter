import 'package:acc_fuel_app_flutter/constants/app_constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getConditionsIdFromName(String name) {
  if (constants.trackConditions.containsValue(name)) {
    String id = constants.trackConditions.keys
        .firstWhere((element) => constants.trackConditions[element] == name);
    return id;
  }
  throw Error();
}

String getConditionsNameFromId(BuildContext context, String id) {
  String? name = constants.trackConditions[id];
  if (name == null) {
    throw Error();
  }
  if (name == "Dry") {
    return AppLocalizations.of(context)!.dry;
  } else if (name == "Damp") {
    return AppLocalizations.of(context)!.damp;
  }
  return AppLocalizations.of(context)!.wet;
}
