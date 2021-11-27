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
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'ACC Fuel Calculator'),
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder<bool>(
            future:
                checkForMigration(), // a previously-obtained Future<String> or null
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                /* IF SNAPSHOT.DATA THEN LAUNCH CALC WITH DIALOG
                  ELSE JUST LAUNCH CALCULATOR SCREEN
                 */
                bool result = snapshot.data as bool;
                children = <Widget>[
                  Icon(
                    Icons.check_circle_outline,
                    color: result ? Colors.green : Colors.red,
                    size: 60,
                  )
                ];
              } else if (snapshot.hasError) {
                children = <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ];
              } else {
                /* CHECKING FOR MIGRATION */
                children = const <Widget>[
                  SizedBox(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                    width: 60,
                    height: 60,
                  )
                ];
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children,
                ),
              );
            }));
  }
}
