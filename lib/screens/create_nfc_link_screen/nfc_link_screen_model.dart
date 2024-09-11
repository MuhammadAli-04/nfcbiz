import '/backend/api_requests/api_calls.dart';
import '/component/drawer/drawer_widget.dart';
import '/component/scan_component/scan_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'nfc_link_screen_widget.dart' show NFCLinkScreenWidget;
import 'package:flutter/material.dart';

class NFCLinkScreenModel extends FlutterFlowModel<NFCLinkScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  Completer<ApiCallResponse>? apiRequestCompleter1;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Model for scan_component component.
  late ScanComponentModel scanComponentModel;
  // Model for drawer component.
  late DrawerModel drawerModel;

  // Stores action output result for [Backend Call - API (Vcard Qr code)] action in Row widget.
  ApiCallResponse? qrCodeRes;
  // Stores action output result for [Custom Action - downloadQrcode] action in Row widget.
  String? res;
  // Stores action output result for [Custom Action - downloadQrInIOS] action in Row widget.
  String? iosRes;
  // Stores action output result for [Backend Call - API (Vcard Qr code)] action in Row widget.
  ApiCallResponse? qrCodeRes1;
  // Stores action output result for [Custom Action - downloadQrcode] action in Row widget.
  String? res1;
  // Stores action output result for [Custom Action - downloadQrInIOS] action in Row widget.
  String? iosRes1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    scanComponentModel = createModel(context, () => ScanComponentModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    scanComponentModel.dispose();
    drawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
