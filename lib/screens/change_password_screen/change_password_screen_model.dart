import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'change_password_screen_widget.dart' show ChangePasswordScreenWidget;
import 'package:flutter/material.dart';

class ChangePasswordScreenModel
    extends FlutterFlowModel<ChangePasswordScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for currentPassword widget.
  FocusNode? currentPasswordFocusNode;
  TextEditingController? currentPasswordController;
  late bool currentPasswordVisibility;
  String? Function(BuildContext, String?)? currentPasswordControllerValidator;
  // State field(s) for newPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordControllerValidator;
  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)? confirmPasswordControllerValidator;
  // Stores action output result for [Backend Call - API (Change Password)] action in Button widget.
  ApiCallResponse? apiResult141;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    currentPasswordVisibility = false;
    newPasswordVisibility = false;
    confirmPasswordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    currentPasswordFocusNode?.dispose();
    currentPasswordController?.dispose();

    newPasswordFocusNode?.dispose();
    newPasswordController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
