import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfc_biz/component/nfc_write_sheet/nfc_write_sheet_widget.dart';
import 'package:nfc_biz/database/db_setup.dart';
import 'package:nfc_biz/flutter_flow/flutter_flow_widgets.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import '/component/drawer/drawer_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'display_nfc_links_list_screen_model.dart';

export 'display_nfc_links_list_screen_model.dart';

class DisplayNFCLinksListScreenWidget extends StatefulWidget {
  const DisplayNFCLinksListScreenWidget({super.key, required this.category});

  final String category;

  @override
  State<DisplayNFCLinksListScreenWidget> createState() =>
      _DisplayNFCLinksListScreenWidgetState();
}

class _DisplayNFCLinksListScreenWidgetState
    extends State<DisplayNFCLinksListScreenWidget> {
  late DisplayNFCLinksListScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  Database? db;
  List<Map<String, dynamic>> data = [];

  final uuid = const Uuid();

  Future<void> setData() async {
    setState(() {
      FFAppState().isAPILoading = true;
    });

    db ??= await initDatabase();

    data = await getItems(db!, widget.category, FFAppState().email);

    setState(() {
      FFAppState().isAPILoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisplayNFCLinksListScreenModel());
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await setData();
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.drawerModel,
            updateCallback: () => setState(() {}),
            child: const DrawerWidget(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              scaffoldKey.currentState!.openDrawer();
            },
            child: Container(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    12.0, 17.0, 25.0, 17.0),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: const Color(0x00FFFFFF),
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      image: Image.asset(
                        'assets/images/drawer.png',
                      ).image,
                    ),
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'y8c3d2ml' /* NFC Link */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Nunito Sans',
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts:
                      GoogleFonts.asMap().containsKey('Nunito Sans'),
                ),
          ),
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.85,
              child: Builder(
                builder: (context) {
                  if (FFAppState().isAPILoading) {
                    return const Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: custom_widgets.CustomLoader(
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    );
                  } else {
                    debugPrint("data length: ${data.length}");

                    return Column(children: [
                      Expanded(
                        child: data.isEmpty
                            ? const Center(
                                child: Text("No URL available"),
                              )
                            : ListView.separated(
                                itemBuilder: (context, index) => InkWell(
                                  child: Material(
                                    elevation: 5.0,
                                    shadowColor: const Color.fromARGB(
                                        103, 241, 225, 172),
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Container(
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 248, 228, 165)),
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          data[index]["uri"]
                                              .toString()
                                              .maybeHandleOverflow(
                                                maxChars: 30,
                                                replacement: "...",
                                              ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black54,
                                                useGoogleFonts:
                                                    GoogleFonts.asMap()
                                                        .containsKey(
                                                            'Nunito Sans'),
                                              ),
                                        ),
                                        subtitle: Text(
                                          data[index]["description"]
                                              .toString()
                                              .maybeHandleOverflow(
                                                maxChars: 30,
                                                replacement: "...",
                                              ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black54,
                                                useGoogleFonts:
                                                    GoogleFonts.asMap()
                                                        .containsKey(
                                                            'Nunito Sans'),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    showAdaptiveDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Center(
                                                child: Text(widget.category)),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                gapY(size: 1),
                                                Text(
                                                  data[index]['uri']
                                                      .toString()
                                                      .maybeHandleOverflow(
                                                          maxChars: 25,
                                                          replacement: "..."),
                                                ),
                                                gapY(size: 10),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    setState(() {
                                                      FFAppState().isLoading =
                                                          true;
                                                    });

                                                    if (isAndroid) {
                                                      _model.res1 = await actions
                                                          .downloadQrcode(
                                                              data[index]['uri']
                                                                  .toString(),
                                                              "customlink_${uuid.v4()}");
                                                      await actions
                                                          .downloadNotification(
                                                        context,
                                                        'Success',
                                                        _model.res1!,
                                                        const Color(0xFF46A44D),
                                                      );
                                                    } else {
                                                      _model.iosRes1 =
                                                          await actions
                                                              .downloadQrInIOS(
                                                        getJsonField(
                                                          (_model.qrCodeRes
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.data[0].url''',
                                                        ).toString(),
                                                      );
                                                      await actions
                                                          .downloadNotification(
                                                        context,
                                                        'Success',
                                                        _model.iosRes1!,
                                                        const Color(0xFF46A44D),
                                                      );
                                                    }

                                                    setState(() {
                                                      FFAppState().isLoading =
                                                          false;
                                                    });

                                                    context.pop();
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 45.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              30,
                                                              124,
                                                              124,
                                                              124),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  10.0,
                                                                  12.0,
                                                                  0.0,
                                                                  12.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child: Image.asset(
                                                              'assets/images/vcard_qr.png',
                                                              width: 30.0,
                                                              height: 20.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '5837yt5h' /* QR Code */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black45,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Nunito Sans'),
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                gapY(size: 2),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pop();

                                                    bool isNfcAvailable =
                                                        await NfcManager
                                                            .instance
                                                            .isAvailable();
                                                    if (isNfcAvailable) {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                NfcWriteSheetWidget(
                                                              url: data[index]
                                                                      ["uri"]
                                                                  .toString(),
                                                              name:
                                                                  "customqr_${uuid.v4()}",
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await actions
                                                          .customSnackbar(
                                                        context,
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          enText:
                                                              'Ensure NFC is enabled on your device if it supports it.',
                                                          arText:
                                                              'تأكد من تمكين NFC على جهازك إذا كان يدعم ذلك.',
                                                          zh_HansText:
                                                              '如果您的设备支持 NFC，请确保已启用 NFC',
                                                          frText:
                                                              'Vérifiez si NFC est activé sur votre appareil.',
                                                          deText:
                                                              'NFC auf Ihrem Gerät aktivieren, wenn unterstützt.',
                                                          ptText:
                                                              'Certifique-se de que o NFC está ativado..',
                                                          ruText:
                                                              'Проверьте, включен ли NFC на устройстве.',
                                                          esText:
                                                              'Asegúrate de que NFC esté habilitado.',
                                                          trText:
                                                              'NFC etkin olduğundan emin olun.',
                                                        ),
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                      );
                                                    }
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 45.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFE4BB31),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    10.0,
                                                                    12.0,
                                                                    0.0,
                                                                    12.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/nfc.png',
                                                                width: 30.0,
                                                                height: 200.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'om39cqak' /* Write NFC */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            'Nunito Sans'),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                gapY(size: 2),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await deleteItem(
                                                        db!, data[index]["id"]);
                                                    await setData();
                                                    context.pop();
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 45.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0x27F35050),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    0.0,
                                                                    12.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              child: const Icon(
                                                                Icons
                                                                    .delete_outline_rounded,
                                                                color: Color(
                                                                    0xFFF35050),
                                                                size: 22.0,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'od72nqlw' /* Delete Link */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    color: const Color(
                                                                        0xFFF35050),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            'Nunito Sans'),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                ),
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemCount: data.length,
                              ),
                      ),
                      gapY(),
                      gapY(),
                      FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed('create_nfc_link_screen',
                              queryParameters: {
                                "category": widget.category
                              }).then((value) async {
                            await setData();
                          });
                        },
                        text: FFLocalizations.of(context).getText(
                          'kcglmo2n' /* Create New + */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFFE4BB31),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ]);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
