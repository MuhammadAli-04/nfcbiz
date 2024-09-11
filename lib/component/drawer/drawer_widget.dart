import '/component/logout_dialog_box/logout_dialog_box_widget.dart';
import '/component/select_group_dialog_box/select_group_dialog_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'drawer_model.dart';
export 'drawer_model.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late DrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 0.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/logo_with_slogan-cropped.png',
                width: 180.0,
                height: 150.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Divider(
            thickness: 1.0,
            color: Color(0xFFDFE5E8),
          ),
          Flexible(
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(5.0, 15.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                  if (FFAppState().selectedDrawerPage != 'Dashboard') {
                    context.goNamed(
                      'dashboard',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                        ),
                      },
                    );
                  }
                  FFAppState().selectedDrawerPage = 'Dashboard';
                },
                child: ListTile(
                  leading: Icon(
                    Icons.pie_chart_sharp,
                    color: FFAppState().selectedDrawerPage == 'Dashboard'
                        ? const Color(0xFFE4BB31)
                        : const Color(0xFFAAB0B8),
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'b3jasfwe' /* Dashboard */,
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Nunito Sans',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Nunito Sans'),
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: false,
                ),
              ),
            ),
          ),
          // Builder(
          //   builder: (context) => Padding(
          //     padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
          //     child: InkWell(
          //       splashColor: Colors.transparent,
          //       focusColor: Colors.transparent,
          //       hoverColor: Colors.transparent,
          //       highlightColor: Colors.transparent,
          //       onTap: () async {
          //         _model.url = await FlutterBarcodeScanner.scanBarcode(
          //           '#C62828', // scanning line color
          //           FFLocalizations.of(context).getText(
          //             '5pw0ml62' /* Cancel */,
          //           ), // cancel button text
          //           true, // whether to show the flash icon
          //           ScanMode.QR,
          //         );

          //         context.safePop();
          //         if (_model.url != '-1') {
          //           setState(() {
          //             FFAppState().scannedURL = _model.url;
          //           });
          //           if (FFAppState().selectedDrawerPage == 'BusinessCards') {
          //             setState(() {
          //               FFAppState().isBusinessScreenSelected = true;
          //             });
          //           } else {
          //             setState(() {
          //               FFAppState().isBusinessScreenSelected = false;
          //             });
          //           }

          //           await showDialog(
          //             context: context,
          //             builder: (dialogContext) {
          //               return Dialog(
          //                 elevation: 0,
          //                 insetPadding: EdgeInsets.zero,
          //                 backgroundColor: Colors.transparent,
          //                 alignment: const AlignmentDirectional(0.0, 0.0)
          //                     .resolve(Directionality.of(context)),
          //                 child: const SelectGroupDialogBoxWidget(),
          //               );
          //             },
          //           ).then((value) => setState(() {}));
          //         }

          //         setState(() {});
          //       },
          //       child: ListTile(
          //         leading: Icon(
          //           Icons.qr_code_scanner_sharp,
          //           color: FFAppState().selectedDrawerPage == 'ScanBusinessCard'
          //               ? const Color(0xFFE4BB31)
          //               : const Color(0xFFAAB0B8),
          //         ),
          //         title: Text(
          //           FFLocalizations.of(context).getText(
          //             '5esgh4un' /* Scan Business Cards */,
          //           ),
          //           style: FlutterFlowTheme.of(context).titleLarge.override(
          //                 fontFamily: 'Nunito Sans',
          //                 fontSize: 16.0,
          //                 fontWeight: FontWeight.bold,
          //                 useGoogleFonts:
          //                     GoogleFonts.asMap().containsKey('Nunito Sans'),
          //               ),
          //         ),
          //         tileColor: FlutterFlowTheme.of(context).secondaryBackground,
          //         dense: false,
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
                if (FFAppState().selectedDrawerPage != 'VCards') {
                  context.goNamed(
                    'vcard_screen',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 300),
                      ),
                    },
                  );
                }
                FFAppState().selectedDrawerPage = 'VCards';
              },
              child: ListTile(
                leading: Icon(
                  Icons.business_center,
                  color: FFAppState().selectedDrawerPage == 'VCards'
                      ? const Color(0xFFE4BB31)
                      : const Color(0xFFAAB0B8),
                ),
                title: Text(
                  FFLocalizations.of(context).getText(
                    'es398s13' /* VCards */,
                  ),
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Nunito Sans',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts:
                            GoogleFonts.asMap().containsKey('Nunito Sans'),
                      ),
                ),
                tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                dense: false,
              ),
            ),
          ),
          if (FFAppState().role != 'Super Admin')
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                  if (FFAppState().selectedDrawerPage != 'Enquiries') {
                    context.goNamed(
                      'enquiries_screen',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                        ),
                      },
                    );
                  }
                  FFAppState().selectedDrawerPage = 'Enquiries';
                  FFAppState().isVcardEnquiry = false;
                },
                child: ListTile(
                  leading: Icon(
                    Icons.info,
                    color: FFAppState().selectedDrawerPage == 'Enquiries'
                        ? const Color(0xFFE4BB31)
                        : const Color(0xFFAAB0B8),
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'uvnyicos' /* Enquiries */,
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Nunito Sans',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Nunito Sans'),
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: false,
                ),
              ),
            ),
          if (FFAppState().role != 'Super Admin')
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                  if (FFAppState().selectedDrawerPage != 'Appointments') {
                    context.goNamed(
                      'appointment_screen',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                        ),
                      },
                    );
                  }
                  FFAppState().selectedDrawerPage = 'Appointments';
                  FFAppState().isVcardAppointment = false;
                },
                child: ListTile(
                  leading: Icon(
                    Icons.calendar_month,
                    color: FFAppState().selectedDrawerPage == 'Appointments'
                        ? const Color(0xFFE4BB31)
                        : const Color(0xFFAAB0B8),
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'ujuhl9mw' /* Appointments */,
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Nunito Sans',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Nunito Sans'),
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: false,
                ),
              ),
            ),
          // Padding(
          //   padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
          //   child: InkWell(
          //     splashColor: Colors.transparent,
          //     focusColor: Colors.transparent,
          //     hoverColor: Colors.transparent,
          //     highlightColor: Colors.transparent,
          //     onTap: () async {
          //       context.safePop();
          //       if (FFAppState().selectedDrawerPage != 'BusinessCards') {
          //         context.goNamed(
          //           'business_card_screen',
          //           extra: <String, dynamic>{
          //             kTransitionInfoKey: const TransitionInfo(
          //               hasTransition: true,
          //               transitionType: PageTransitionType.fade,
          //               duration: Duration(milliseconds: 300),
          //             ),
          //           },
          //         );
          //       }
          //       FFAppState().selectedDrawerPage = 'BusinessCards';
          //       FFAppState().selectedBusinessGroupIndex = 0;
          //     },
          //     child: ListTile(
          //       leading: Icon(
          //         Icons.perm_contact_cal_rounded,
          //         color: FFAppState().selectedDrawerPage == 'BusinessCards'
          //             ? const Color(0xFFE4BB31)
          //             : const Color(0xFFAAB0B8),
          //       ),
          //       title: Text(
          //         FFLocalizations.of(context).getText(
          //           '7myfbppy' /* Business Cards */,
          //         ),
          //         style: FlutterFlowTheme.of(context).titleLarge.override(
          //               fontFamily: 'Nunito Sans',
          //               fontSize: 16.0,
          //               fontWeight: FontWeight.bold,
          //               useGoogleFonts:
          //                   GoogleFonts.asMap().containsKey('Nunito Sans'),
          //             ),
          //       ),
          //       tileColor: FlutterFlowTheme.of(context).secondaryBackground,
          //       dense: false,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
                if (FFAppState().selectedDrawerPage != 'TicketsScreen') {
                  context.goNamed(
                    'tickets_screen',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 300),
                      ),
                    },
                  );
                }
                FFAppState().selectedDrawerPage = 'TicketsScreen';
              },
              child: ListTile(
                leading: Icon(
                  Icons.confirmation_num,
                  color: FFAppState().selectedDrawerPage == 'TicketsScreen'
                      ? const Color(0xFFE4BB31)
                      : const Color(0xFFAAB0B8),
                ),
                title: Text(
                  FFLocalizations.of(context).getText(
                    'k7b696tk' /* Ticket Support*/,
                  ),
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Nunito Sans',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts:
                            GoogleFonts.asMap().containsKey('Nunito Sans'),
                      ),
                ),
                tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                dense: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
                if (FFAppState().selectedDrawerPage != 'NFCLinkScreen') {
                  context.goNamed(
                    'nfc_link_screen',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 300),
                      ),
                    },
                  );
                }
                FFAppState().selectedDrawerPage = 'NFCLinkScreen';
              },
              child: ListTile(
                leading: Icon(
                  Icons.link,
                  color: FFAppState().selectedDrawerPage == 'NFCLinkScreen'
                      ? const Color(0xFFE4BB31)
                      : const Color(0xFFAAB0B8),
                ),
                title: Text(
                  FFLocalizations.of(context).getText(
                    'y8c3d2ml' /* Add Your Link*/,
                  ),
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Nunito Sans',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts:
                            GoogleFonts.asMap().containsKey('Nunito Sans'),
                      ),
                ),
                tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                dense: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
                if (FFAppState().selectedDrawerPage != 'Settings') {
                  context.goNamed(
                    'setting_screen',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 300),
                      ),
                    },
                  );
                }
                FFAppState().selectedDrawerPage = 'Settings';
              },
              child: ListTile(
                leading: Icon(
                  Icons.settings_rounded,
                  color: FFAppState().selectedDrawerPage == 'Settings'
                      ? const Color(0xFFE4BB31)
                      : const Color(0xFFAAB0B8),
                ),
                title: Text(
                  FFLocalizations.of(context).getText(
                    'etqjz79k' /* Setting */,
                  ),
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Nunito Sans',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts:
                            GoogleFonts.asMap().containsKey('Nunito Sans'),
                      ),
                ),
                tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                dense: false,
              ),
            ),
          ),
          Builder(
            builder: (context) => Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: const AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: const LogoutDialogBoxWidget(),
                      );
                    },
                  ).then((value) => setState(() {}));
                },
                child: ListTile(
                  leading: const Icon(
                    Icons.logout_outlined,
                    color: Color(0xFFAAB0B8),
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'l0kd7rcm' /* Log out */,
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Nunito Sans',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Nunito Sans'),
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: false,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
