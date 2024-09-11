import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_profile_screen_model.dart';
export 'edit_profile_screen_model.dart';

class EditProfileScreenWidget extends StatefulWidget {
  const EditProfileScreenWidget({
    super.key,
    required this.profileData,
  });

  final dynamic profileData;

  @override
  State<EditProfileScreenWidget> createState() =>
      _EditProfileScreenWidgetState();
}

class _EditProfileScreenWidgetState extends State<EditProfileScreenWidget> {
  late EditProfileScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileScreenModel());

    _model.firstNameFocusNode ??= FocusNode();

    _model.lastNameFocusNode ??= FocusNode();

    _model.emailFocusNode ??= FocusNode();

    _model.contactFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '2rucwo9a' /* Edit Profile */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Nunito Sans',
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts:
                      GoogleFonts.asMap().containsKey('Nunito Sans'),
                ),
          ),
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.7,
                decoration: const BoxDecoration(),
                child: FutureBuilder<ApiCallResponse>(
                  future: VcardGroup.profileCall.call(
                    authToken: FFAppState().authToken,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitFadingCircle(
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    final columnProfileResponse = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 35.0),
                              child: Container(
                                width: 110.0,
                                height: 110.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.network(
                                      VcardGroup.profileCall.image(
                                        columnProfileResponse.jsonBody,
                                      )!,
                                    ).image,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment:
                                      const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 110.0,
                                    height: 110.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.memory(
                                          _model.uploadedLocalFile.bytes ??
                                              Uint8List.fromList([]),
                                        ).image,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(1.0, 1.0),
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor: const Color(0xFFE4BB31),
                                            icon: const Icon(
                                              Icons.camera_alt,
                                              color: Colors.white,
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                allowPhoto: true,
                                                textColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                pickerFontFamily: 'Nunito Sans',
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                setState(() => _model
                                                    .isDataUploading = true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                try {
                                                  selectedUploadedFiles =
                                                      selectedMedia
                                                          .map((m) =>
                                                              FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                          .toList();
                                                } finally {
                                                  _model.isDataUploading =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                        .length ==
                                                    selectedMedia.length) {
                                                  setState(() {
                                                    _model.uploadedLocalFile =
                                                        selectedUploadedFiles
                                                            .first;
                                                  });
                                                } else {
                                                  setState(() {});
                                                  return;
                                                }
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 1.0,
                            color: Color(0xFFAAB0B8),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'xzao1gj9' /* Full Name: */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.firstNameController ??=
                                  TextEditingController(
                                text: VcardGroup.profileCall.firstName(
                                  columnProfileResponse.jsonBody,
                                ),
                              ),
                              focusNode: _model.firstNameFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintText: FFLocalizations.of(context).getText(
                                  'hiprfz0c' /* Enter First Name */,
                                ),
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.firstNameControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.lastNameController ??=
                                  TextEditingController(
                                text: VcardGroup.profileCall.lastName(
                                  columnProfileResponse.jsonBody,
                                ),
                              ),
                              focusNode: _model.lastNameFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintText: FFLocalizations.of(context).getText(
                                  'clqyndho' /* Enter Last Name */,
                                ),
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.lastNameControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'dtstmqtx' /* Email: */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Nunito Sans'),
                                        ),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'hzqkgpzd' /*  * */,
                                    ),
                                    style: const TextStyle(
                                      color: Color(0xFFF35050),
                                      fontSize: 18.0,
                                    ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.emailController ??=
                                  TextEditingController(
                                text: VcardGroup.profileCall.email(
                                  columnProfileResponse.jsonBody,
                                ),
                              ),
                              focusNode: _model.emailFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintText: FFLocalizations.of(context).getText(
                                  'r7tg0ukf' /* Enter Email */,
                                ),
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.emailControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      '1za1kahu' /* Contact Number: */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Nunito Sans'),
                                        ),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      '8eu3zng3' /*  * */,
                                    ),
                                    style: const TextStyle(
                                      color: Color(0xFFF35050),
                                      fontSize: 18.0,
                                    ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 55.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: const Color(0xFFDFE5E8),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 115.0,
                                    height: 100.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF6F8F9),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    alignment:
                                        const AlignmentDirectional(0.0, 0.0),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: custom_widgets.PrefixCodePicker(
                                        width: double.infinity,
                                        height: double.infinity,
                                        code: valueOrDefault<String>(
                                          VcardGroup.profileCall.regionCode(
                                            columnProfileResponse.jsonBody,
                                          ),
                                          '+91',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.contactController ??=
                                            TextEditingController(
                                          text: VcardGroup.profileCall.contact(
                                            columnProfileResponse.jsonBody,
                                          ),
                                        ),
                                        focusNode: _model.contactFocusNode,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'bi0q9hyu' /* Enter Contact number */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .contactControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          ///For Demo APK
                          // if(FFAppState().email == 'sadmin@vcard.com'||FFAppState().email == 'admin@vcard.com'){
                          //   await actions.customSnackbar(
                          //     context,
                          //     FFLocalizations.of(context).getVariableText(
                          //       enText: 'This action not allowed for default records.',
                          //       arText: 'هذا الإجراء غير مسموح به للسجلات الافتراضية.',
                          //       zh_HansText: '默认记录不允许此操作.',
                          //       frText: "Cette action n'est pas autorisée pour les enregistrements par défaut.",
                          //       deText: 'Diese Aktion ist für Standarddatensätze nicht zulässig.',
                          //       ptText: 'Esta ação não é permitida para registros padrão.',
                          //       ruText: 'Это действие не разрешено для стандартных записей.',
                          //       esText: 'Esta acción no está permitida para registros predeterminados.',
                          //       trText: 'Bu işlem varsayılan kayıtlar için izin verilmez.',
                          //     ),
                          //     FlutterFlowTheme.of(context).error,
                          //   );
                          // }else{
                          //   if ((_model.firstNameController.text != '') &&
                          //       functions.textFieldValidator(
                          //           _model.firstNameController.text)) {
                          //     if ((_model.lastNameController.text != '') &&
                          //         functions.textFieldValidator(
                          //             _model.lastNameController.text)) {
                          //       _model.emailRes = await actions.emailValidation(
                          //         _model.emailController.text,
                          //       );
                          //       if (_model.emailRes == true) {
                          //         if ((_model.emailController.text != '') &&
                          //             functions.textFieldValidator(
                          //                 _model.emailController.text)) {
                          //           if ((_model.contactController.text != '') &&
                          //               functions.textFieldValidator(
                          //                   _model.contactController.text)) {
                          //             _model.apiResultrga =
                          //             await VcardGroup.profileUpdateCall.call(
                          //               firstName:
                          //               _model.firstNameController.text,
                          //               contact: _model.contactController.text,
                          //               email: _model.emailController.text,
                          //               regionCode: FFAppState().prefixCode,
                          //               profile: _model.uploadedLocalFile,
                          //               authToken: FFAppState().authToken,
                          //               lastName: _model.lastNameController.text,
                          //             );
                          //             if ((_model.apiResultrga?.succeeded ??
                          //                 true)) {
                          //               context.safePop();
                          //               await actions.customSnackbar(
                          //                 context,
                          //                 FFLocalizations.of(context)
                          //                     .getVariableText(
                          //                   enText:
                          //                   'Profile Update Successfully.',
                          //                   arText:
                          //                   'تم تحديث الملف الشخصي بنجاح.',
                          //                   zh_HansText: '个人资料更新成功。',
                          //                   frText:
                          //                   'Mise à jour du profil réussie.',
                          //                   deText:
                          //                   'Profilaktualisierung erfolgreich.',
                          //                   ptText:
                          //                   'Atualização do perfil com sucesso.',
                          //                   ruText: 'Обновление профиля успешно.',
                          //                   esText:
                          //                   'Actualización de perfil exitosa.',
                          //                   trText:
                          //                   'Profil Güncellemesi Başarıyla.',
                          //                 ),
                          //                 const Color(0xFF46A44D),
                          //               );
                          //             } else {
                          //               await actions.customSnackbar(
                          //                 context,
                          //                 FFLocalizations.of(context)
                          //                     .getVariableText(
                          //                   enText: 'Profile Update Failed.',
                          //                   arText: 'فشل تحديث الملف الشخصي.',
                          //                   zh_HansText: '配置文件更新失败。',
                          //                   frText:
                          //                   'Échec de la mise à jour du profil.',
                          //                   deText:
                          //                   'Profilaktualisierung fehlgeschlagen.',
                          //                   ptText:
                          //                   'Falha na atualização do perfil.',
                          //                   ruText:
                          //                   'Обновление профиля не удалось.',
                          //                   esText:
                          //                   'Error al actualizar el perfil.',
                          //                   trText:
                          //                   'Profil Güncellemesi Başarısız.',
                          //                 ),
                          //                 FlutterFlowTheme.of(context).error,
                          //               );
                          //             }
                          //           } else {
                          //             if (_model.contactController.text == '') {
                          //               await actions.customSnackbar(
                          //                 context,
                          //                 FFLocalizations.of(context)
                          //                     .getVariableText(
                          //                   enText: 'Please Enter Contact no.',
                          //                   arText: 'الرجاء إدخال رقم الاتصال.',
                          //                   zh_HansText: '请输入联络号码',
                          //                   frText:
                          //                   'Veuillez entrer le numéro de contact.',
                          //                   deText:
                          //                   'Bitte geben Sie die Kontakt-Nr. ein.',
                          //                   ptText:
                          //                   'Por favor, insira o número de contato.',
                          //                   ruText:
                          //                   'Пожалуйста, введите контактный номер.',
                          //                   esText:
                          //                   'Por favor ingrese el número de contacto.',
                          //                   trText:
                          //                   'Lütfen İletişim numarasını giriniz.',
                          //                 ),
                          //                 FlutterFlowTheme.of(context).error,
                          //               );
                          //             } else {
                          //               await actions.customSnackbar(
                          //                 context,
                          //                 FFLocalizations.of(context)
                          //                     .getVariableText(
                          //                   enText:
                          //                   'Please Enter Valid Contact no.',
                          //                   arText: 'الرجاء إدخال رقم الاتصال.',
                          //                   zh_HansText: '请输入联络号码',
                          //                   frText:
                          //                   'Veuillez entrer le numéro de contact.',
                          //                   deText:
                          //                   'Bitte geben Sie die Kontakt-Nr. ein.',
                          //                   ptText:
                          //                   'Por favor, insira o número de contato.',
                          //                   ruText:
                          //                   'Пожалуйста, введите контактный номер.',
                          //                   esText:
                          //                   'Por favor ingrese el número de contacto.',
                          //                   trText:
                          //                   'Lütfen İletişim numarasını giriniz.',
                          //                 ),
                          //                 FlutterFlowTheme.of(context).error,
                          //               );
                          //             }
                          //           }
                          //         } else {
                          //           if (_model.emailController.text == '') {
                          //             await actions.customSnackbar(
                          //               context,
                          //               FFLocalizations.of(context)
                          //                   .getVariableText(
                          //                 enText: 'Please Enter Email.',
                          //                 arText:
                          //                 'الرجاء إدخال البريد الإلكتروني.',
                          //                 zh_HansText: ' 请输入电子邮件.',
                          //                 frText: 'Veuillez saisir votre e-mail.',
                          //                 deText:
                          //                 'Bitte geben Sie Ihre E-Mail-Adresse ein.',
                          //                 ptText: 'Por favor, insira o e-mail.',
                          //                 ruText:
                          //                 'Пожалуйста, введите адрес электронной почты.',
                          //                 esText:
                          //                 'Por favor ingrese el correo electrónico.',
                          //                 trText: 'Lütfen e-posta giriniz.',
                          //               ),
                          //               FlutterFlowTheme.of(context).error,
                          //             );
                          //           } else {
                          //             await actions.customSnackbar(
                          //               context,
                          //               FFLocalizations.of(context)
                          //                   .getVariableText(
                          //                 enText: 'Please Enter Valid Email.',
                          //                 arText:
                          //                 'الرجاء إدخال البريد الإلكتروني.',
                          //                 zh_HansText: ' 请输入电子邮件.',
                          //                 frText: 'Veuillez saisir votre e-mail.',
                          //                 deText:
                          //                 'Bitte geben Sie Ihre E-Mail-Adresse ein.',
                          //                 ptText: 'Por favor, insira o e-mail.',
                          //                 ruText:
                          //                 'Пожалуйста, введите адрес электронной почты.',
                          //                 esText:
                          //                 'Por favor ingrese el correo electrónico.',
                          //                 trText: 'Lütfen e-posta giriniz.',
                          //               ),
                          //               FlutterFlowTheme.of(context).error,
                          //             );
                          //           }
                          //         }
                          //       } else {
                          //         await actions.customSnackbar(
                          //           context,
                          //           FFLocalizations.of(context).getVariableText(
                          //             enText: 'Please Enter Valid Email.',
                          //             arText: 'الرجاء إدخال البريد الإلكتروني.',
                          //             zh_HansText: ' 请输入电子邮件.',
                          //             frText: 'Veuillez saisir votre e-mail.',
                          //             deText:
                          //             'Bitte geben Sie Ihre E-Mail-Adresse ein.',
                          //             ptText: 'Por favor, insira o e-mail.',
                          //             ruText:
                          //             'Пожалуйста, введите адрес электронной почты.',
                          //             esText:
                          //             'Por favor ingrese el correo electrónico.',
                          //             trText: 'Lütfen e-posta giriniz.',
                          //           ),
                          //           FlutterFlowTheme.of(context).error,
                          //         );
                          //       }
                          //     } else {
                          //       if (_model.lastNameController.text == '') {
                          //         await actions.customSnackbar(
                          //           context,
                          //           FFLocalizations.of(context).getVariableText(
                          //             enText: 'Please Enter Last name.',
                          //             arText: 'الرجاء إدخال الاسم الأخير.',
                          //             zh_HansText: '请输入姓氏',
                          //             frText:
                          //             'Veuillez saisir votre nom de famille.',
                          //             deText:
                          //             'Bitte geben Sie den Nachnamen ein.',
                          //             ptText: 'Lütfen Soyadınızı Giriniz.',
                          //             ruText: 'Lütfen Soyadınızı Giriniz.',
                          //             esText: 'Lütfen Soyadınızı Giriniz.',
                          //             trText: 'Lütfen Soyadınızı Giriniz.',
                          //           ),
                          //           FlutterFlowTheme.of(context).error,
                          //         );
                          //       } else {
                          //         await actions.customSnackbar(
                          //           context,
                          //           FFLocalizations.of(context).getVariableText(
                          //             enText: 'Please Enter Valid Last name.',
                          //             arText: 'الرجاء إدخال اسم العائلة صالح.',
                          //             zh_HansText: '请输入有效的姓氏.',
                          //             frText:
                          //             'Veuillez saisir un nom de famille valide.',
                          //             deText:
                          //             'Bitte geben Sie einen gültigen Nachnamen ein.',
                          //             ptText: 'Insira um sobrenome válido.',
                          //             ruText:
                          //             'Пожалуйста, введите действительную фамилию.',
                          //             esText:
                          //             'Por favor ingrese un apellido válido.',
                          //             trText: 'Lütfen Geçerli Soyadı Girin.',
                          //           ),
                          //           FlutterFlowTheme.of(context).error,
                          //         );
                          //       }
                          //     }
                          //   } else {
                          //     if (_model.firstNameController.text == '') {
                          //       await actions.customSnackbar(
                          //         context,
                          //         FFLocalizations.of(context).getVariableText(
                          //           enText: 'Please Enter First name.',
                          //           arText: 'الرجاء إدخال الاسم الأول.',
                          //           zh_HansText: '请输入名字.',
                          //           frText: 'Veuillez saisir votre prénom.',
                          //           deText: 'Bitte geben Sie den Vornamen ein.',
                          //           ptText: 'Por favor, insira o primeiro nome.',
                          //           ruText: 'Пожалуйста, введите имя.',
                          //           esText: 'Por favor ingrese el nombre.',
                          //           trText: 'Lütfen Adınızı Girin.',
                          //         ),
                          //         FlutterFlowTheme.of(context).error,
                          //       );
                          //     } else {
                          //       await actions.customSnackbar(
                          //         context,
                          //         FFLocalizations.of(context).getVariableText(
                          //           enText: 'Please Enter Valid First name.',
                          //           arText: 'الرجاء إدخال الاسم الأول الصحيح.',
                          //           zh_HansText: '请输入有效的名字.',
                          //           frText: 'Veuillez saisir un prénom valide.',
                          //           deText:
                          //           'Bitte geben Sie einen gültigen Vornamen ein.',
                          //           ptText: 'Insira um nome válido.',
                          //           ruText:
                          //           'Пожалуйста, введите действительное имя.',
                          //           esText: 'Por favor ingrese un nombre válido.',
                          //           trText: 'Lütfen Geçerli Ad Girin.',
                          //         ),
                          //         FlutterFlowTheme.of(context).error,
                          //       );
                          //     }
                          //   }
                          // }

                          ///For Regular
                          if ((_model.firstNameController.text != '') &&
                              functions.textFieldValidator(
                                  _model.firstNameController.text)) {
                            if ((_model.lastNameController.text != '') &&
                                functions.textFieldValidator(
                                    _model.lastNameController.text)) {
                              _model.emailRes = await actions.emailValidation(
                                _model.emailController.text,
                              );
                              if (_model.emailRes == true) {
                                if ((_model.emailController.text != '') &&
                                    functions.textFieldValidator(
                                        _model.emailController.text)) {
                                  if ((_model.contactController.text != '') &&
                                      functions.textFieldValidator(
                                          _model.contactController.text)) {
                                    _model.apiResultrga =
                                        await VcardGroup.profileUpdateCall.call(
                                      firstName:
                                          _model.firstNameController.text,
                                      contact: _model.contactController.text,
                                      email: _model.emailController.text,
                                      regionCode: FFAppState().prefixCode,
                                      profile: _model.uploadedLocalFile,
                                      authToken: FFAppState().authToken,
                                      lastName: _model.lastNameController.text,
                                    );
                                    if ((_model.apiResultrga?.succeeded ??
                                        true)) {
                                      context.safePop();
                                      await actions.customSnackbar(
                                        context,
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText:
                                              'Profile Update Successfully.',
                                          arText:
                                              'تم تحديث الملف الشخصي بنجاح.',
                                          zh_HansText: '个人资料更新成功。',
                                          frText:
                                              'Mise à jour du profil réussie.',
                                          deText:
                                              'Profilaktualisierung erfolgreich.',
                                          ptText:
                                              'Atualização do perfil com sucesso.',
                                          ruText: 'Обновление профиля успешно.',
                                          esText:
                                              'Actualización de perfil exitosa.',
                                          trText:
                                              'Profil Güncellemesi Başarıyla.',
                                        ),
                                        const Color(0xFF46A44D),
                                      );
                                    } else {
                                      await actions.customSnackbar(
                                        context,
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: 'Profile Update Failed.',
                                          arText: 'فشل تحديث الملف الشخصي.',
                                          zh_HansText: '配置文件更新失败。',
                                          frText:
                                              'Échec de la mise à jour du profil.',
                                          deText:
                                              'Profilaktualisierung fehlgeschlagen.',
                                          ptText:
                                              'Falha na atualização do perfil.',
                                          ruText:
                                              'Обновление профиля не удалось.',
                                          esText:
                                              'Error al actualizar el perfil.',
                                          trText:
                                              'Profil Güncellemesi Başarısız.',
                                        ),
                                        FlutterFlowTheme.of(context).error,
                                      );
                                    }
                                  } else {
                                    if (_model.contactController.text == '') {
                                      await actions.customSnackbar(
                                        context,
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: 'Please Enter Contact no.',
                                          arText: 'الرجاء إدخال رقم الاتصال.',
                                          zh_HansText: '请输入联络号码',
                                          frText:
                                              'Veuillez entrer le numéro de contact.',
                                          deText:
                                              'Bitte geben Sie die Kontakt-Nr. ein.',
                                          ptText:
                                              'Por favor, insira o número de contato.',
                                          ruText:
                                              'Пожалуйста, введите контактный номер.',
                                          esText:
                                              'Por favor ingrese el número de contacto.',
                                          trText:
                                              'Lütfen İletişim numarasını giriniz.',
                                        ),
                                        FlutterFlowTheme.of(context).error,
                                      );
                                    } else {
                                      await actions.customSnackbar(
                                        context,
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText:
                                              'Please Enter Valid Contact no.',
                                          arText: 'الرجاء إدخال رقم الاتصال.',
                                          zh_HansText: '请输入联络号码',
                                          frText:
                                              'Veuillez entrer le numéro de contact.',
                                          deText:
                                              'Bitte geben Sie die Kontakt-Nr. ein.',
                                          ptText:
                                              'Por favor, insira o número de contato.',
                                          ruText:
                                              'Пожалуйста, введите контактный номер.',
                                          esText:
                                              'Por favor ingrese el número de contacto.',
                                          trText:
                                              'Lütfen İletişim numarasını giriniz.',
                                        ),
                                        FlutterFlowTheme.of(context).error,
                                      );
                                    }
                                  }
                                } else {
                                  if (_model.emailController.text == '') {
                                    await actions.customSnackbar(
                                      context,
                                      FFLocalizations.of(context)
                                          .getVariableText(
                                        enText: 'Please Enter Email.',
                                        arText:
                                            'الرجاء إدخال البريد الإلكتروني.',
                                        zh_HansText: ' 请输入电子邮件.',
                                        frText: 'Veuillez saisir votre e-mail.',
                                        deText:
                                            'Bitte geben Sie Ihre E-Mail-Adresse ein.',
                                        ptText: 'Por favor, insira o e-mail.',
                                        ruText:
                                            'Пожалуйста, введите адрес электронной почты.',
                                        esText:
                                            'Por favor ingrese el correo electrónico.',
                                        trText: 'Lütfen e-posta giriniz.',
                                      ),
                                      FlutterFlowTheme.of(context).error,
                                    );
                                  } else {
                                    await actions.customSnackbar(
                                      context,
                                      FFLocalizations.of(context)
                                          .getVariableText(
                                        enText: 'Please Enter Valid Email.',
                                        arText:
                                            'الرجاء إدخال البريد الإلكتروني.',
                                        zh_HansText: ' 请输入电子邮件.',
                                        frText: 'Veuillez saisir votre e-mail.',
                                        deText:
                                            'Bitte geben Sie Ihre E-Mail-Adresse ein.',
                                        ptText: 'Por favor, insira o e-mail.',
                                        ruText:
                                            'Пожалуйста, введите адрес электронной почты.',
                                        esText:
                                            'Por favor ingrese el correo electrónico.',
                                        trText: 'Lütfen e-posta giriniz.',
                                      ),
                                      FlutterFlowTheme.of(context).error,
                                    );
                                  }
                                }
                              } else {
                                await actions.customSnackbar(
                                  context,
                                  FFLocalizations.of(context).getVariableText(
                                    enText: 'Please Enter Valid Email.',
                                    arText: 'الرجاء إدخال البريد الإلكتروني.',
                                    zh_HansText: ' 请输入电子邮件.',
                                    frText: 'Veuillez saisir votre e-mail.',
                                    deText:
                                        'Bitte geben Sie Ihre E-Mail-Adresse ein.',
                                    ptText: 'Por favor, insira o e-mail.',
                                    ruText:
                                        'Пожалуйста, введите адрес электронной почты.',
                                    esText:
                                        'Por favor ingrese el correo electrónico.',
                                    trText: 'Lütfen e-posta giriniz.',
                                  ),
                                  FlutterFlowTheme.of(context).error,
                                );
                              }
                            } else {
                              if (_model.lastNameController.text == '') {
                                await actions.customSnackbar(
                                  context,
                                  FFLocalizations.of(context).getVariableText(
                                    enText: 'Please Enter Last name.',
                                    arText: 'الرجاء إدخال الاسم الأخير.',
                                    zh_HansText: '请输入姓氏',
                                    frText:
                                        'Veuillez saisir votre nom de famille.',
                                    deText:
                                        'Bitte geben Sie den Nachnamen ein.',
                                    ptText: 'Lütfen Soyadınızı Giriniz.',
                                    ruText: 'Lütfen Soyadınızı Giriniz.',
                                    esText: 'Lütfen Soyadınızı Giriniz.',
                                    trText: 'Lütfen Soyadınızı Giriniz.',
                                  ),
                                  FlutterFlowTheme.of(context).error,
                                );
                              } else {
                                await actions.customSnackbar(
                                  context,
                                  FFLocalizations.of(context).getVariableText(
                                    enText: 'Please Enter Valid Last name.',
                                    arText: 'الرجاء إدخال اسم العائلة صالح.',
                                    zh_HansText: '请输入有效的姓氏.',
                                    frText:
                                        'Veuillez saisir un nom de famille valide.',
                                    deText:
                                        'Bitte geben Sie einen gültigen Nachnamen ein.',
                                    ptText: 'Insira um sobrenome válido.',
                                    ruText:
                                        'Пожалуйста, введите действительную фамилию.',
                                    esText:
                                        'Por favor ingrese un apellido válido.',
                                    trText: 'Lütfen Geçerli Soyadı Girin.',
                                  ),
                                  FlutterFlowTheme.of(context).error,
                                );
                              }
                            }
                          } else {
                            if (_model.firstNameController.text == '') {
                              await actions.customSnackbar(
                                context,
                                FFLocalizations.of(context).getVariableText(
                                  enText: 'Please Enter First name.',
                                  arText: 'الرجاء إدخال الاسم الأول.',
                                  zh_HansText: '请输入名字.',
                                  frText: 'Veuillez saisir votre prénom.',
                                  deText: 'Bitte geben Sie den Vornamen ein.',
                                  ptText: 'Por favor, insira o primeiro nome.',
                                  ruText: 'Пожалуйста, введите имя.',
                                  esText: 'Por favor ingrese el nombre.',
                                  trText: 'Lütfen Adınızı Girin.',
                                ),
                                FlutterFlowTheme.of(context).error,
                              );
                            } else {
                              await actions.customSnackbar(
                                context,
                                FFLocalizations.of(context).getVariableText(
                                  enText: 'Please Enter Valid First name.',
                                  arText: 'الرجاء إدخال الاسم الأول الصحيح.',
                                  zh_HansText: '请输入有效的名字.',
                                  frText: 'Veuillez saisir un prénom valide.',
                                  deText:
                                      'Bitte geben Sie einen gültigen Vornamen ein.',
                                  ptText: 'Insira um nome válido.',
                                  ruText:
                                      'Пожалуйста, введите действительное имя.',
                                  esText: 'Por favor ingrese un nombre válido.',
                                  trText: 'Lütfen Geçerli Ad Girin.',
                                ),
                                FlutterFlowTheme.of(context).error,
                              );
                            }
                          }

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'gef46sip' /* Save */,
                        ),
                        options: FFButtonOptions(
                          width: 175.0,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFFE4BB31),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
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
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.safePop();
                        },
                        text: FFLocalizations.of(context).getText(
                          'u8el6evt' /* Cancel */,
                        ),
                        options: FFButtonOptions(
                          width: 175.0,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFFF6F8F9),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: const Color(0xFF79818A),
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
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
                  ].divide(const SizedBox(width: 15.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
