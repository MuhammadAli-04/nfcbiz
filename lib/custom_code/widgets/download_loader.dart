import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DownloadLoader extends StatefulWidget {
  const DownloadLoader({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<DownloadLoader> createState() => _DownloadLoaderState();
}

class _DownloadLoaderState extends State<DownloadLoader> {
  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCircle(
      color: Colors.black,
      size: 30,
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
