import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<bool> writeNFCActioniniOS(
  BuildContext context,
  String url,
  String name,
) async {
  bool isDone = false;
  try {
    const platform = MethodChannel('com.mycompany.infyvcard/nfcWriter');
    try {
      if (!url.startsWith("http")) {
        url = "https://$url";
      }
      final bool success = await platform.invokeMethod('write', url.toString());
      isDone = success;
    } on PlatformException catch (e) {
      isDone = false;
    }
  } catch (e) {
    isDone = false;
  }
  Navigator.pop(context);
  return isDone;
}
