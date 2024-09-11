import 'dart:io';
import 'dart:math';
import 'package:image/image.dart';
import 'package:qr_image/qr_image.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermissions() async {
  await [
    Permission.storage,
  ].request();
}

Future<String> downloadQrcode(
  String url,
  String name,
) async {
  await requestPermissions();

  int randomNumber = Random().nextInt(1000000);
  String imageName = '$name-$randomNumber';
  Directory directory1 = Directory('/storage/emulated/0/Pictures');

  if (!await directory1.exists()) {
    await directory1.create(recursive: true);
  }

  final filePath = '${directory1.path}/$imageName.jpg';

  try {
    var qrImage = QRImage(
      url,
      backgroundColor: ColorUint8.rgb(255, 255, 255),
      size: 300,
    ).generate();

    File imageFile = File(filePath);
    await imageFile.writeAsBytes(encodeJpg(qrImage));

    // Save the image in the specified directory
    bool? isSaved = await GallerySaver.saveImage(filePath);
    if (isSaved!) {
      return 'Image downloaded successfully at: Pictures';
    } else {
      return 'Failed to save image to gallery.';
    }
  } catch (e) {
    debugPrint(e.toString());
    return 'Error: ${e.toString()}';
  }
}
