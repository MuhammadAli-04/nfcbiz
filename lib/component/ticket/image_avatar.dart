import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../flutter_flow/flutter_flow_theme.dart';

class ImageAvatar extends StatelessWidget {
  const ImageAvatar({
    super.key,
    required this.imgURL,
    required this.companyName,
  });

  final String imgURL;
  final String companyName;

  String extractInitials(String companyName) => companyName
      .splitMapJoin(RegExp(r'\s+'),
          onMatch: (m) => '', onNonMatch: (n) => n.isNotEmpty ? n[0] : '')
      .toUpperCase();

  @override
  Widget build(BuildContext context) {
    debugPrint("imgURl: $imgURL");
    return Container(
      height: 60.0,
      padding: const EdgeInsets.all(3.0),
      decoration: const BoxDecoration(
        color: Color(0xFFE4BB31),
        shape: BoxShape.circle,
      ),
      child: imgURL.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.network(
                imgURL,
                // height: 50.0,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      color: Color(0xFFE4BB31),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        extractInitials(companyName),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Nunito Sans',
                              fontSize: 20.0,
                              color: Colors.white,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey('Nunito Sans'),
                            ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Container(
              padding: const EdgeInsets.all(15.0),
              decoration: const BoxDecoration(
                color: Color(0xFFE4BB31),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  extractInitials(companyName),
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Nunito Sans',
                        fontSize: 20.0,
                        color: Colors.white,
                        useGoogleFonts:
                            GoogleFonts.asMap().containsKey('Nunito Sans'),
                      ),
                ),
              ),
            ),
    );
  }
}
