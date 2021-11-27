import 'package:acc_fuel_app_flutter/config/dark_theme.dart';
import 'package:acc_fuel_app_flutter/config/light_theme.dart';
import 'package:acc_fuel_app_flutter/modules/screens/calculator_screen.dart';
import 'package:acc_fuel_app_flutter/utils/ui/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:acc_fuel_app_flutter/utils/helpers/v2_to_v3_migrator.dart';

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
        ),
        body: calculatorScreen());
  }
}
