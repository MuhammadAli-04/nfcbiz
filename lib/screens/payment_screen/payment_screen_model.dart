import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_screen_widget.dart' show PaymentScreenWidget;
import 'package:flutter/material.dart';

class PaymentScreenModel extends FlutterFlowModel<PaymentScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Subscription plan buy)] action in Button widget.
  ApiCallResponse? apiResultlye;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
