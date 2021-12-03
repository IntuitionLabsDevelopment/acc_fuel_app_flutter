import 'package:acc_fuel_app_flutter/modules/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class SettingsRoute extends StatelessWidget {
  const SettingsRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Container(
          child: settingsScreen(context),
          constraints: const BoxConstraints(maxWidth: 700),
        ),
      )),
    );
  }
}
