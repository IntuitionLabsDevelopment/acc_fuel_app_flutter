import 'package:flutter/material.dart';
import 'package:acc_fuel_app_flutter/constants/app_constants.dart' as constants;
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

void migrationDialog(BuildContext context) async {
  List<Widget> actionChildren = [];
  final InAppReview inAppReview = InAppReview.instance;

  if (await inAppReview.isAvailable()) {
    actionChildren.add(ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
        ),
        onPressed: () async {
          Navigator.of(context).pop();
          inAppReview.openStoreListing(appStoreId: '1540153714');
        },
        child: const Text('Leave a review')));
  }
  actionChildren.addAll([
    ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
        ),
        onPressed: () async {
          Navigator.of(context).pop();
          await launch(constants.githubRepo);
        },
        child: const Text('View Github Repo')),
    ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
        ),
        onPressed: () async {
          Navigator.of(context).pop();
          if (Platform.isAndroid) {
            await launch(constants.androidProVersion);
          } else if (Platform.isIOS) {
            await launch(constants.iosProVersion);
          }
        },
        child: const Text('Purchase Ad-Free Pro Version')),
  ]);

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('A Thank You Message!'),
      content: Container(
          height: 200,
          child: const SingleChildScrollView(
              child: Text(constants.thankYouForInstalling))),
      actions: actionChildren,
    ),
  );
}
