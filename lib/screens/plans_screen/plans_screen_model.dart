import '/flutter_flow/flutter_flow_util.dart';
import 'plans_screen_widget.dart' show PlansScreenWidget;
import 'package:flutter/material.dart';

class PlansScreenModel extends FlutterFlowModel<PlansScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
