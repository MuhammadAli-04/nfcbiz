import 'package:flutter/material.dart';

import 'package:app_settings/app_settings.dart';

Future openSettings(BuildContext context) async {
  Navigator.pop(context);
  return AppSettings.openAppSettings();
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
