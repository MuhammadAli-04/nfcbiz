import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '/component/nfc_write_sheet/nfc_write_sheet_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nfc_link_sheet_model.dart';

export 'nfc_link_sheet_model.dart';

class NFCLinkSheetWidget extends StatefulWidget {
  const NFCLinkSheetWidget({
    super.key,
    required this.url,
  });

  final String? url;

  @override
  State<NFCLinkSheetWidget> createState() => _NFCLinkSheetWidgetState();
}

class _NFCLinkSheetWidgetState extends State<NFCLinkSheetWidget> {
  late NFCLinkSheetModel _model;

  final uuid = const Uuid();
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NFCLinkSheetModel());
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
      height: FFAppState().role == 'Super Admin'
          ? (isAndroid ? 250.0 : 205.0)
          : (isAndroid ? 305.0 : 260.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(
              builder: (context) {
                return Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F8F9),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().isLoading = true;
                              });

                              if (isAndroid) {
                                _model.res1 = await actions.downloadQrcode(
                                    widget.url!, "customlink_${uuid.v4()}");
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
                  ),
                );
              },
            ),
            if (isAndroid)
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    bool isNfcAvailable =
                        await NfcManager.instance.isAvailable();
                    if (isNfcAvailable) {
                      context.safePop();
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: NfcWriteSheetWidget(
                              url: widget.url!,
                              name: "customqr_${uuid.v4()}",
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    } else {
                      Navigator.pop(context);
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
              ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  bool isNfcAvailable = await NfcManager.instance.isAvailable();
                  if (isNfcAvailable) {
                    context.safePop();
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: NfcWriteSheetWidget(
                            url: widget.url!,
                            name: "customqr_${uuid.v4()}",
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  } else {
                    Navigator.pop(context);
                    await actions.customSnackbar(
                      context,
                      FFLocalizations.of(context).getVariableText(
                        enText:
                            'Ensure NFC is enabled on your device if it supports it.',
                        arText: 'تأكد من تمكين NFC على جهازك إذا كان يدعم ذلك.',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
