import 'package:flutter/material.dart';

final ButtonStyle raisedButtonStyleDark = ElevatedButton.styleFrom(
  foregroundColor: Colors.white70,
  backgroundColor: Colors.red[700],
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

final ButtonStyle raisedButtonStyleLight = ElevatedButton.styleFrom(
  foregroundColor: Colors.white,
  backgroundColor: Colors.red[600],
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

final ButtonStyle outlinedButtonStyleDark = OutlinedButton.styleFrom(
  backgroundColor: Colors.red[700],
  padding: const EdgeInsets.symmetric(horizontal: 16),
  side: BorderSide(color: Colors.red[700] ?? Colors.red),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

final ButtonStyle outlinedButtonStyleLight = OutlinedButton.styleFrom(
  backgroundColor: Colors.red[600],
  padding: const EdgeInsets.symmetric(horizontal: 16),
  side: BorderSide(color: Colors.red[600] ?? Colors.red),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);
