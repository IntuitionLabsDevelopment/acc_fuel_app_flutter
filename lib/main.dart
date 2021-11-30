import 'package:acc_fuel_app_flutter/config/dark_theme.dart';
import 'package:acc_fuel_app_flutter/config/light_theme.dart';
import 'package:acc_fuel_app_flutter/modules/routes/settings_route.dart';
import 'package:acc_fuel_app_flutter/modules/screens/calculator_screen.dart';
import 'package:acc_fuel_app_flutter/utils/ui/app_dialogs.dart';
import 'package:acc_fuel_app_flutter/widgets/form/input_options.dart';
import 'package:acc_fuel_app_flutter/widgets/selections_section.dart';
import 'package:flutter/material.dart';
import 'package:acc_fuel_app_flutter/utils/helpers/v2_to_v3_migrator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ACC Fuel Calculator',
      theme: lightTheme,
      home: const MyHomePage(title: 'ACC Fuel Calculator'),
      darkTheme: darkTheme,
    );
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
    _initCombos();
  }

  _checkMigrated() async {
    bool migrated = await checkForMigration();
    if (migrated) {
      migrationDialog(context);
    }
  }

  _initCombos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

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
    if (setClass != null) {
      updateClass(setClass);
    } else {
      updateClass('GT3');
    }

    String? setCar = prefs.getString('setCar');
    if (setCar != null) {
      updateCar(setCar);
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
        body: SingleChildScrollView(child: calculatorScreen(context)));
  }
}
