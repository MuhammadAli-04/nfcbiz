import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_screen_widget.dart' show EditProfileScreenWidget;
import 'package:flutter/material.dart';

class EditProfileScreenModel extends FlutterFlowModel<EditProfileScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for first_name widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // State field(s) for last_name widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for contact widget.
  FocusNode? contactFocusNode;
  TextEditingController? contactController;
  String? Function(BuildContext, String?)? contactControllerValidator;
  // Stores action output result for [Custom Action - emailValidation] action in Button widget.
  bool? emailRes;
  // Stores action output result for [Backend Call - API (Profile Update)] action in Button widget.
  ApiCallResponse? apiResultrga;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    firstNameFocusNode?.dispose();
    firstNameController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    contactFocusNode?.dispose();
    contactController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
