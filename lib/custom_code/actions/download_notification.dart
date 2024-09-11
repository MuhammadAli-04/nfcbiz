import 'package:flutter/material.dart';

Future downloadNotification(
  BuildContext context,
  String title,
  String subtitle,
  Color bgColor,
) async {
  // Add your function code here!
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: bgColor,
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          right: 10,
          left: 10),
    ),
  );
}
