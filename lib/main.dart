import 'package:acc_fuel_app_flutter/config/dark_theme.dart';
import 'package:acc_fuel_app_flutter/config/light_theme.dart';
import 'package:acc_fuel_app_flutter/modules/routes/settings_route.dart';
import 'package:acc_fuel_app_flutter/modules/screens/calculator_screen.dart';
import 'package:acc_fuel_app_flutter/utils/ui/app_dialogs.dart';
import 'package:acc_fuel_app_flutter/widgets/form/input_options.dart';
import 'package:acc_fuel_app_flutter/widgets/language_dropdown.dart';
import 'package:acc_fuel_app_flutter/widgets/selections_section.dart';
import 'package:acc_fuel_app_flutter/widgets/theme_options_dropdown.dart';
import 'package:acc_fuel_app_flutter/widgets/unit_switch.dart';
import 'package:flutter/material.dart';
import 'package:acc_fuel_app_flutter/utils/helpers/v2_to_v3_migrator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:acc_fuel_app_flutter/constants/app_constants.dart' as constants;

Future<void> initCombos() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? setTheme = prefs.getString('setTheme');
  if (setTheme != null) {
    updateTheme(setTheme);
  }

  String? setLocaleCode = prefs.getString('setLocaleCode');
  if (setLocaleCode != null) {
    updateLocale(setLocaleCode);
  }

  bool? setUsingLitres = prefs.getBool('setUsingLitres');
  if (setUsingLitres != null) {
    updateUsingLitres(setUsingLitres);
  }

  bool? setFormationLap = prefs.getBool('setFormationLap');
  if (setFormationLap != null) {
    updateFormationLap(setFormationLap);
  }

  bool? setUsingStint = prefs.getBool('setUsingStint');
  if (setUsingStint != null) {
    updateUsingStint(setUsingStint);
  }

  String? setConditions = prefs.getString('setConditions');
  if (setConditions != null) {
    updateConditions(setConditions);
  }

  String? setTrack = prefs.getString('setTrack');
  if (setTrack != null) {
    updateTracks(setTrack);
  }

  String? setClass = prefs.getString('setClass');
  String? setCar = prefs.getString('setCar');
  if (setClass != null && constants.classes.keys.contains(setClass)) {
    updateClass(setClass);
    if (setCar != null && constants.classes[setClass]!.contains(setCar)) {
      updateCar(setCar);
    } else {
      updateCar(constants.classes[setClass]![0]);
    }
  } else {
    updateClass('GT3');
    updateCar('0');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initCombos();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: localeNotifier,
        builder: (BuildContext context, Locale locale, Widget? child) {
          return ValueListenableBuilder(
              valueListenable: themeModeNotifier,
              builder: (BuildContext context, String themeMode, Widget? child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'ACC Fuel Calculator',
                  home: const MyHomePage(title: 'ACC Fuel Calculator'),
                  themeMode: constants.themes[themeMode],
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  locale: locale,
                  supportedLocales: AppLocalizations.supportedLocales,
                  localizationsDelegates: const [
                    ...AppLocalizations.localizationsDelegates
                  ],
                );
              });
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _checkMigrated();
  }

  _checkMigrated() async {
    bool migrated = await checkForMigration();
    if (migrated) {
      migrationDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsRoute()),
                    );
                  },
                  child: const Icon(Icons.settings),
                )),
          ],
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Container(
            child: calculatorScreen(context),
            constraints: const BoxConstraints(maxWidth: 700),
          ),
        )));
  }
}
