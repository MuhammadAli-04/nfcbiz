import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfc_biz/component/nfc_write_sheet/nfc_write_sheet_widget.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import '../../database/db_setup.dart';
import '/component/drawer/drawer_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nfc_link_screen_model.dart';

export 'nfc_link_screen_model.dart';

class NFCLinkScreenWidget extends StatefulWidget {
  const NFCLinkScreenWidget({super.key, required this.category, this.url});

  final String category;
  final String? url;

  @override
  State<NFCLinkScreenWidget> createState() => _NFCLinkScreenWidgetState();
}

class _NFCLinkScreenWidgetState extends State<NFCLinkScreenWidget> {
  late NFCLinkScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final linkController = TextEditingController();
  final descriptionController = TextEditingController();
  String? selectedCategory;
  late Database db;

  final uuid = const Uuid();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NFCLinkScreenModel());
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        linkController.text = widget.url ?? "";
        selectedCategory = widget.category;
      });
      db = await initDatabase();
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: Column(
                  children: [
                    TextField(
                      maxLength: 40,
                      minLines: 1,
                      maxLines: 2,
                      cursorColor: const Color(0xFFE4BB31),
                      decoration: InputDecoration(
                        labelText: "URL Name",
                        hintStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Nunito Sans',
                                  color: Colors.black54,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Nunito Sans'),
                                ),
                        labelStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Nunito Sans',
                                  color: Colors.black54,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Nunito Sans'),
                                ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color(0xFFE4BB31),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color(0xFFE4BB31),
                          ),
                        ),
                      ),
                      controller: descriptionController,
                    ),
                    gapY(),
                    gapY(),
                    TextField(
                      cursorColor: const Color(0xFFE4BB31),
                      decoration: InputDecoration(
                        labelText: "Paste your link here",
                        hintStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Nunito Sans',
                                  color: Colors.black54,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Nunito Sans'),
                                ),
                        labelStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Nunito Sans',
                                  color: Colors.black54,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Nunito Sans'),
                                ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color(0xFFE4BB31),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color(0xFFE4BB31),
                          ),
                        ),
                      ),
                      controller: linkController,
                    ),
                    gapY(),
                    gapY(),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedCategory,
                          underline: Container(),
                          onChanged: (String? newValue) {
                            if (newValue == null) {
                              return;
                            }
                            setState(() {
                              selectedCategory = newValue;
                            });
                          },
                          hint: Text(
                            "URL Category",
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: Colors.black54,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Nunito Sans'),
                                ),
                          ),
                          items: getURLCategories()
                              .map(
                                (item) => DropdownMenuItem<String>(
                                    value: item, child: Text(item)),
                              )
                              .toList()),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F8F9),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (linkController.text.trim().isEmpty) {
                              await actions.customSnackbar(
                                context,
                                "Please fill all the inputs first",
                                FlutterFlowTheme.of(context).error,
                              );

                              return;
                            }
                            FocusScope.of(context)
                                .requestFocus(_model.unfocusNode);
                            setState(() {
                              FFAppState().isLoading = true;
                            });

                            if (isAndroid) {
                              _model.res1 = await actions.downloadQrcode(
                                  linkController.text,
                                  "customlink_${uuid.v4()}");
                              await actions.downloadNotification(
                                context,
                                'Success',
                                _model.res1!,
                                const Color(0xFF46A44D),
                              );
                            } else {
                              _model.iosRes1 = await actions.downloadQrInIOS(
                                getJsonField(
                                  (_model.qrCodeRes?.jsonBody ?? ''),
                                  r'''$.data[0].url''',
                                ).toString(),
                              );
                              await actions.downloadNotification(
                                context,
                                'Success',
                                _model.iosRes1!,
                                const Color(0xFF46A44D),
                              );
                            }

                            setState(() {
                              FFAppState().isLoading = false;
                            });

                            setState(() {});
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 12.0, 0.0, 12.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/vcard_qr.png',
                                    width: 30.0,
                                    height: 200.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '5837yt5h' /* QR Code */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Nunito Sans'),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  gapY(),
                  gapY(),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (linkController.text.trim().isEmpty) {
                        await actions.customSnackbar(
                          context,
                          "Please fill all the inputs first",
                          FlutterFlowTheme.of(context).error,
                        );

                        return;
                      }
                      FocusScope.of(context).requestFocus(_model.unfocusNode);

                      bool isNfcAvailable =
                          await NfcManager.instance.isAvailable();
                      if (isNfcAvailable) {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: NfcWriteSheetWidget(
                                url: linkController.text,
                                name: "customqr_${Random().nextInt(1000000)}",
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      } else {
                        await actions.customSnackbar(
                          context,
                          FFLocalizations.of(context).getVariableText(
                            enText:
                                'Ensure NFC is enabled on your device if it supports it.',
                            arText:
                                'تأكد من تمكين NFC على جهازك إذا كان يدعم ذلك.',
                            zh_HansText: '如果您的设备支持 NFC，请确保已启用 NFC',
                            frText:
                                'Vérifiez si NFC est activé sur votre appareil.',
                            deText:
                                'NFC auf Ihrem Gerät aktivieren, wenn unterstützt.',
                            ptText: 'Certifique-se de que o NFC está ativado..',
                            ruText: 'Проверьте, включен ли NFC на устройстве.',
                            esText: 'Asegúrate de que NFC esté habilitado.',
                            trText: 'NFC etkin olduğundan emin olun.',
                          ),
                          FlutterFlowTheme.of(context).error,
                        );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE4BB31),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 12.0, 0.0, 12.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/nfc.png',
                                  width: 30.0,
                                  height: 200.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'om39cqak' /* Write NFC */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Nunito Sans'),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  gapY(),
                  gapY(),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (linkController.text.trim().isEmpty) {
                        await actions.customSnackbar(
                          context,
                          "Please fill all the inputs first",
                          FlutterFlowTheme.of(context).error,
                        );

                        return;
                      }

                      FocusScope.of(context).requestFocus(_model.unfocusNode);

                      await insertItem(db, {
                        "description": descriptionController.text,
                        "uri": linkController.text,
                        "category": selectedCategory ?? "Custom URL",
                        "email": FFAppState().email
                      });

                      await actions.customSnackbar(
                        context,
                        "URL saved in ${selectedCategory ?? "Custom URL"} category",
                        FlutterFlowTheme.of(context).success,
                      );

                      context.pop();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE4BB31),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 0.0, 12.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: const Icon(
                                  Icons.save_alt,
                                  color: Colors.white,
                                  size: 22.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'zd8zu4bj' /* Save */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Nunito Sans'),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
