import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../flutter_flow/flutter_flow_theme.dart';

String truncateFilename(String filename, int maxLength) {
  int dotIndex = filename.lastIndexOf('.');
  if (dotIndex <= 0 || dotIndex >= filename.length - 1) {
    return filename;
  }

  String baseName = filename.substring(0, dotIndex);
  String extension = filename.substring(dotIndex);

  if (baseName.length > maxLength) {
    baseName = '${baseName.substring(0, maxLength - 4)}...';
  }

  return baseName + extension;
}

class FileButton extends StatelessWidget {
  const FileButton({
    super.key,
    required this.fileName,
    required this.onPressed,
  });

  final String fileName;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(fileName),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xFFE4BB31),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              truncateFilename(fileName, 30),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nunito Sans',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts:
                        GoogleFonts.asMap().containsKey('Nunito Sans'),
                  ),
            ),
            Icon(
              Icons.delete,
              color: Colors.red,
              size: FlutterFlowTheme.of(context).bodyLarge.fontSize,
            )
          ],
        ),
      ),
    );
  }
}
