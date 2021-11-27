import 'package:flutter/material.dart';

void migrationDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => const AlertDialog(
            content: Text("Thank you"),
          ));
}
