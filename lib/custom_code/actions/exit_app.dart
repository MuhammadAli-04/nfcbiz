import 'dart:io';
import 'package:flutter/services.dart';

Future exitApp(bool isIos) async {
  // Add your function code here!
  if (isIos) {
    exit(0);
  } else {
    SystemNavigator.pop();
  }
}
