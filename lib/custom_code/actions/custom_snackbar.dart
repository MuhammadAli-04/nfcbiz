import 'package:flutter/material.dart';

Future customSnackbar(
  BuildContext context,
  String subtitle,
  Color bgColor,
) async {
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
    ),
  );
}
