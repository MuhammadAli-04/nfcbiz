import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfc_biz/flutter_flow/flutter_flow_theme.dart';
import 'package:nfc_biz/flutter_flow/flutter_flow_util.dart';

class Reply extends StatelessWidget {
  const Reply({super.key, required this.replyData});

  final Map<String, dynamic> replyData;

  @override
  Widget build(BuildContext context) {
    List<dynamic> media = getJsonField(replyData, r'''$.media''', true)
        .map((imageData) =>
            getJsonField(imageData, r'''$.original_url''').toString())
        .toList();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: const Color.fromARGB(255, 252, 229, 151)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getJsonField(replyData, r'''$.user.name''')
                  .toString()
                  .toUpperCase()
                  .trim()
                  .maybeHandleOverflow(maxChars: 25, replacement: "..."),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nunito Sans',
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w900,
                    useGoogleFonts:
                        GoogleFonts.asMap().containsKey('Nunito Sans'),
                  ),
            ),
            gapY(),
            Text(
              formatDateTime(
                getJsonField(replyData, r'''$.created_at'''),
              ),
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Nunito Sans',
                    color: Colors.black45,
                    fontWeight: FontWeight.w700,
                    useGoogleFonts:
                        GoogleFonts.asMap().containsKey('Nunito Sans'),
                  ),
            ),
            gapY(),
            gapY(),
            gapY(),
            gapY(),
            Text(
              getJsonField(replyData, r'''$.description'''),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nunito Sans',
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts:
                        GoogleFonts.asMap().containsKey('Nunito Sans'),
                  ),
            ),
            media.isNotEmpty
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: media
                          .map(
                            (imgUrl) => Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 8.0,
                                right: 16.0,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: InkWell(
                                  onTap: () {
                                    showAdaptiveDialog(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            child: Image.network(
                                              imgUrl.toString(),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              fit: BoxFit.fitWidth,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              },
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Container(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color(0xFFE4BB31),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Center(
                                                      child: Icon(
                                                    Icons.error,
                                                    color: Colors.red,
                                                  )),
                                                );
                                              },
                                            ),
                                          );
                                        });
                                  },
                                  child: Image.network(
                                    imgUrl.toString(),
                                    height: 60.0,
                                    width: 60.0,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFE4BB31),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Center(
                                            child: Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        )),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
