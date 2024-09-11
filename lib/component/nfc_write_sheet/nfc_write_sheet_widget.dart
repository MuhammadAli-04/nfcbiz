import 'package:nfc_manager/nfc_manager.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'nfc_write_sheet_model.dart';
export 'nfc_write_sheet_model.dart';

class NfcWriteSheetWidget extends StatefulWidget {
  const NfcWriteSheetWidget({
    super.key,
    required this.url,
    required this.name,
  });

  final String? url;
  final String? name;

  @override
  State<NfcWriteSheetWidget> createState() => _NfcWriteSheetWidgetState();
}

class _NfcWriteSheetWidgetState extends State<NfcWriteSheetWidget> {
  late NfcWriteSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NfcWriteSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isDone = false;
      if (isAndroid) {
        _model.isDone = await actions.writeNFCAction(
          context,
          widget.url!,
          widget.name!,
        );
      }

      if (isiOS) {
        await NfcManager.instance.startSession(onDiscovered: (tag) async {
          try {
            final ndef = Ndef.from(tag);
            if (ndef == null || !ndef.isWritable) {
              throw Exception('Tag is not ndef writable');
            }

            String url = widget.url!;
            debugPrint(url.toString());
            if (!url.startsWith("http")) {
              url = "https://${url}";
            }

            NdefMessage message = NdefMessage([
              NdefRecord.createUri(Uri.parse(url!)),
            ]);
            await ndef.write(message);
            await NfcManager.instance
                .stopSession(alertMessage: 'NFC write successful');
            _model.isDone = true;
          } catch (error) {
            debugPrint(error.toString());
            NfcManager.instance.stopSession(errorMessage: 'NFC write failed');
          }
        });
      }

      if (isiOS) {
        context.pop();
      }

      await Future.delayed(const Duration(milliseconds: 100));
      if (_model.isDone!) {
        await actions.customSnackbar(
          context,
          FFLocalizations.of(context).getVariableText(
            enText: 'NFC card write Successfully.',
            arText: 'تمت كتابة بطاقة NFC بنجاح.',
            zh_HansText: 'NFC卡写入成功。',
            frText: 'Écriture sur la carte NFC avec succès.',
            deText: 'NFC-Karte erfolgreich schreiben.',
            ptText: 'Gravação do cartão NFC com sucesso.',
            ruText: 'Карта NFC записывается успешно.',
            esText: 'La tarjeta NFC se escribe correctamente.',
            trText: 'NFC kartı başarıyla yazıldı.',
          ),
          const Color(0xFF46A44D),
        );
      } else {
        await actions.customSnackbar(
          context,
          FFLocalizations.of(context).getVariableText(
            enText: 'NFC card write failed.',
            arText: 'فشلت الكتابة على بطاقة NFC.',
            zh_HansText: 'NFC 卡写入失败。',
            frText: 'Échec de l\'écriture de la carte NFC.',
            deText: 'Das Schreiben der NFC-Karte ist fehlgeschlagen.',
            ptText: 'Falha na gravação do cartão NFC.',
            ruText: 'Ошибка записи карты NFC.',
            esText: 'Error al escribir en la tarjeta NFC.',
            trText: 'NFC kartına yazma işlemi başarısız oldu.',
          ),
          FlutterFlowTheme.of(context).error,
        );
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      return const SizedBox();
    }
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                child: Container(
                  width: 80.0,
                  height: 3.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E3E7),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Text(
              FFLocalizations.of(context).getText(
                'p8kqv4fo' /* Ready To Write */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nunito Sans',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts:
                        GoogleFonts.asMap().containsKey('Nunito Sans'),
                  ),
            ),
            Text(
              FFLocalizations.of(context).getText(
                '94hehnjl' /* Move your phone closer to 
the... */
                ,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w600,
                    useGoogleFonts:
                        GoogleFonts.asMap().containsKey('Nunito Sans'),
                  ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 20.0),
              child: Container(
                width: 90.0,
                height: 90.0,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/Icon.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.safePop();
                },
                text: FFLocalizations.of(context).getText(
                  'ozm3csxv' /* Cancel */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 45.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0xFFF6F8F9),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Nunito Sans',
                        color: const Color(0xFF79818A),
                        fontWeight: FontWeight.bold,
                        useGoogleFonts:
                            GoogleFonts.asMap().containsKey('Nunito Sans'),
                      ),
                  elevation: 0.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
