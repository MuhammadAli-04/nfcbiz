import '/component/drawer/drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tickets_details_widget.dart' show TicketDetailsWidget;
import 'package:flutter/material.dart';

class TicketDetailsModel extends FlutterFlowModel<TicketDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for drawer component.
  late DrawerModel drawerModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
