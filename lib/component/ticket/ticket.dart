import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfc_biz/component/ticket/image_avatar.dart';
import 'package:nfc_biz/component/ticket/status_button.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';

class Ticket extends StatelessWidget {
  const Ticket({super.key, required this.ticketsItem, this.profileImg});

  final Map<String, dynamic> ticketsItem;
  final String? profileImg;

  String trimTitle(String title) =>
      title.length < 20 ? title : "${title.substring(0, 20)}...";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          "ticket_details_screen",
          queryParameters: {
            'ticketId': serializeParam(
              getJsonField(
                ticketsItem,
                r'''$.id''',
              ),
              ParamType.int,
            ),
            'customerName': serializeParam(
              getJsonField(
                ticketsItem,
                r'''$.user.name''',
              ),
              ParamType.int,
            ),
            'categoryName': serializeParam(
              getJsonField(
                ticketsItem,
                r'''$.category.name''',
              ),
              ParamType.int,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 300),
            ),
          },
        );
      },
      child: Material(
        elevation: 5.0,
        shadowColor: const Color.fromARGB(103, 241, 225, 172),
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: 100.0,
          // color: Colors.red[50],
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: const Color.fromARGB(255, 248, 228, 165)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ImageAvatar(
                    imgURL: profileImg ??
                        getJsonField(
                          ticketsItem,
                          r'''$.user.photo_url''',
                        ).toString().trim(),
                    companyName: getJsonField(
                      ticketsItem,
                      r'''$.user.name''',
                    ).toString().trim(),
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          getJsonField(
                            ticketsItem,
                            r'''$.user.name''',
                          ).toString().trim().toUpperCase().maybeHandleOverflow(
                              maxChars: 15, replacement: "..."),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w900,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          getJsonField(
                            ticketsItem,
                            r'''$.title''',
                          ).toString().trim().maybeHandleOverflow(
                              maxChars: 20, replacement: "..."),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          getJsonField(
                            ticketsItem,
                            r'''$.category.name''',
                          ).toString().trim().maybeHandleOverflow(
                              maxChars: 25, replacement: "..."),
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.grey,
                                    fontSize: 10.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          formatDateTime(getJsonField(
                            ticketsItem,
                            r'''$.created_at''',
                          ).toString().trim()),
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.grey,
                                    fontSize: 10.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              StatusButton(
                ticketStatus: getJsonField(
                  ticketsItem,
                  r'''$.status''',
                ),
                closedAt: getJsonField(
                  ticketsItem,
                  r'''$.close_at''',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
