import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'language_screen_widget.dart' show LanguageScreenWidget;
import 'package:flutter/material.dart';

class LanguageScreenModel extends FlutterFlowModel<LanguageScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Language Update)] action in Container widget.
  ApiCallResponse? apiResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
