import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:nfc_biz/flutter_flow/flutter_flow_theme.dart';

import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/flutter_flow_util.dart';
import 'scan_component_model.dart';

export 'scan_component_model.dart';

class ScanComponentWidget extends StatefulWidget {
  const ScanComponentWidget({
    super.key,
    bool? isBusinessCardScreen,
  }) : isBusinessCardScreen = isBusinessCardScreen ?? false;

  final bool isBusinessCardScreen;

  @override
  State<ScanComponentWidget> createState() => _ScanComponentWidgetState();
}

class _ScanComponentWidgetState extends State<ScanComponentWidget> {
  late ScanComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          _model.url = await FlutterBarcodeScanner.scanBarcode(
            '#C62828', // scanning line color
            FFLocalizations.of(context).getText(
              'g6ibpxlk' /* Cancel */,
            ), // cancel button text
            true, // whether to show the flash icon
            ScanMode.QR,
          );

          if (_model.url != '-1') {
            //todo:
            context.pushNamed("create_nfc_link_screen", queryParameters: {
              "category": "Custom URL",
              "url": _model.url,
            });
          } else {
            await actions.customSnackbar(
              context,
              FFLocalizations.of(context).getVariableText(
                enText: 'No data available in QR code.',
                arText: 'لا توجد بيانات متاحة في رمز QR.',
                zh_HansText: '二维码中无可用数据。',
                frText: 'Aucune donnée disponible dans le code QR.',
                deText: 'Keine Daten im QR-Code verfügbar.',
                ptText: 'Nenhum dado disponível no código QR.',
                ruText: 'В QR-коде нет доступных данных.',
                esText: 'No hay datos disponibles en el código QR.',
                trText: 'QR kodunda mevcut veri yok.',
              ),
              FlutterFlowTheme.of(context).error,
            );
          }
        },
        child: Container(
          width: 60.0,
          height: 100.0,
          decoration: const BoxDecoration(
            color: Color(0x00FFFFFF),
          ),
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: 23.0,
            height: 23.0,
            decoration: BoxDecoration(
              color: const Color(0x00FFFFFF),
              image: DecorationImage(
                fit: BoxFit.contain,
                alignment: const AlignmentDirectional(0.0, 0.0),
                image: Image.asset(
                  'assets/images/scan.png',
                ).image,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
