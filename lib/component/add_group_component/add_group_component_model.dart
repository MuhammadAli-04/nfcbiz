import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_group_component_widget.dart' show AddGroupComponentWidget;
import 'package:flutter/material.dart';

class AddGroupComponentModel extends FlutterFlowModel<AddGroupComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Group Create)] action in Button widget.
  ApiCallResponse? apiResult16n;
  // Stores action output result for [Backend Call - API (Admin Group Create)] action in Button widget.
  ApiCallResponse? adminGroupRes;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
