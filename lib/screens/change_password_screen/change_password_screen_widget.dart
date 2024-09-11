import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_password_screen_model.dart';
export 'change_password_screen_model.dart';

class ChangePasswordScreenWidget extends StatefulWidget {
  const ChangePasswordScreenWidget({super.key});

  @override
  State<ChangePasswordScreenWidget> createState() =>
      _ChangePasswordScreenWidgetState();
}

class _ChangePasswordScreenWidgetState
    extends State<ChangePasswordScreenWidget> {
  late ChangePasswordScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePasswordScreenModel());

    _model.currentPasswordController ??= TextEditingController();
    _model.currentPasswordFocusNode ??= FocusNode();

    _model.newPasswordController ??= TextEditingController();
    _model.newPasswordFocusNode ??= FocusNode();

    _model.confirmPasswordController ??= TextEditingController();
    _model.confirmPasswordFocusNode ??= FocusNode();
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
              'malgoxmk' /* Change Password */,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'xcayyr1i' /* Current Password: */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey('Nunito Sans'),
                            ),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'gj7gq0fk' /*  * */,
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
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: TextFormField(
                  controller: _model.currentPasswordController,
                  focusNode: _model.currentPasswordFocusNode,
                  obscureText: !_model.currentPasswordVisibility,
                  decoration: InputDecoration(
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    hintText: FFLocalizations.of(context).getText(
                      'rm8akjbc' /* Current Password */,
                    ),
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFE0E3E7),
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
                    suffixIcon: InkWell(
                      onTap: () => setState(
                        () => _model.currentPasswordVisibility =
                            !_model.currentPasswordVisibility,
                      ),
                      focusNode: FocusNode(skipTraversal: true),
                      child: Icon(
                        _model.currentPasswordVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: const Color(0xFF79818A),
                        size: 20.0,
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  validator: _model.currentPasswordControllerValidator
                      .asValidator(context),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          '3h03ny4j' /* New Password: */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey('Nunito Sans'),
                            ),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'u6iv42vg' /*  * */,
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
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: TextFormField(
                  controller: _model.newPasswordController,
                  focusNode: _model.newPasswordFocusNode,
                  obscureText: !_model.newPasswordVisibility,
                  decoration: InputDecoration(
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    hintText: FFLocalizations.of(context).getText(
                      '38oe3q7h' /* New Password */,
                    ),
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
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
                    suffixIcon: InkWell(
                      onTap: () => setState(
                        () => _model.newPasswordVisibility =
                            !_model.newPasswordVisibility,
                      ),
                      focusNode: FocusNode(skipTraversal: true),
                      child: Icon(
                        _model.newPasswordVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: const Color(0xFF79818A),
                        size: 20.0,
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  validator: _model.newPasswordControllerValidator
                      .asValidator(context),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          '7aycies1' /* Confirm Password: */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey('Nunito Sans'),
                            ),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'c6hsm8d0' /*  * */,
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
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: TextFormField(
                  controller: _model.confirmPasswordController,
                  focusNode: _model.confirmPasswordFocusNode,
                  obscureText: !_model.confirmPasswordVisibility,
                  decoration: InputDecoration(
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    hintText: FFLocalizations.of(context).getText(
                      'a73s21iu' /* Confirm Password */,
                    ),
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
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
                    suffixIcon: InkWell(
                      onTap: () => setState(
                        () => _model.confirmPasswordVisibility =
                            !_model.confirmPasswordVisibility,
                      ),
                      focusNode: FocusNode(skipTraversal: true),
                      child: Icon(
                        _model.confirmPasswordVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: const Color(0xFF79818A),
                        size: 20.0,
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  validator: _model.confirmPasswordControllerValidator
                      .asValidator(context),
                ),
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
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
                          //   if (_model.currentPasswordController.text != '') {
                          //     if (_model.newPasswordController.text != '') {
                          //       if (_model.confirmPasswordController.text != '') {
                          //         if (_model.newPasswordController.text ==
                          //             _model.confirmPasswordController.text) {
                          //           _model.apiResult141 =
                          //           await VcardGroup.changePasswordCall.call(
                          //             authToken: FFAppState().authToken,
                          //             email: FFAppState().email,
                          //             oldPassword:
                          //             _model.currentPasswordController.text,
                          //             newPassword:
                          //             _model.newPasswordController.text,
                          //             confirmPassword:
                          //             _model.confirmPasswordController.text,
                          //           );
                          //           if ((_model.apiResult141?.succeeded ??
                          //               true)) {
                          //             context.safePop();
                          //             await actions.customSnackbar(
                          //               context,
                          //               FFLocalizations.of(context)
                          //                   .getVariableText(
                          //                 enText:
                          //                 'Password Changed Successfully.',
                          //                 arText: 'تم تغيير الرقم السري بنجاح.',
                          //                 zh_HansText: '密码修改成功',
                          //                 frText:
                          //                 'Le mot de passe a été changé avec succès.',
                          //                 deText:
                          //                 'Das Passwort wurde erfolgreich geändert.',
                          //                 ptText: 'Senha alterada com sucesso.',
                          //                 ruText: 'Пароль успешно изменен.',
                          //                 esText:
                          //                 'Contraseña cambiada con éxito.',
                          //                 trText:
                          //                 'Parola başarıyla değiştirildi.',
                          //               ),
                          //               const Color(0xFF46A44D),
                          //             );
                          //           } else {
                          //             await actions.customSnackbar(
                          //               context,
                          //               FFLocalizations.of(context)
                          //                   .getVariableText(
                          //                 enText: 'Password change failed.',
                          //                 arText: 'فشل تغيير كلمة المرور',
                          //                 zh_HansText: '修改密码失败',
                          //                 frText:
                          //                 'La modification du mot de passe a échoué',
                          //                 deText:
                          //                 'Passwortänderung fehlgeschlagen',
                          //                 ptText: 'Falha na alteração da senha',
                          //                 ruText: 'Смена пароля не удалась',
                          //                 esText:
                          //                 'Error al cambiar la contraseña',
                          //                 trText:
                          //                 'Şifre değiştirme başarısız oldu',
                          //               ),
                          //               FlutterFlowTheme.of(context).error,
                          //             );
                          //           }
                          //         } else {
                          //           await actions.customSnackbar(
                          //             context,
                          //             FFLocalizations.of(context).getVariableText(
                          //               enText: 'Please enter correct password.',
                          //               arText:
                          //               'الرجاء إدخال كلمة المرور الصحيحة.',
                          //               zh_HansText: '请输入正确的密码',
                          //               frText:
                          //               'Veuillez saisir le mot de passe correct.',
                          //               deText:
                          //               'Bitte geben Sie das richtige Passwort ein.',
                          //               ptText:
                          //               'Por favor insira a senha correta.',
                          //               ruText:
                          //               'Пожалуйста, введите правильный пароль.',
                          //               esText:
                          //               'Por favor ingrese la contraseña correcta.',
                          //               trText: 'Lütfen doğru şifreyi girin.',
                          //             ),
                          //             FlutterFlowTheme.of(context).error,
                          //           );
                          //         }
                          //       } else {
                          //         await actions.customSnackbar(
                          //           context,
                          //           FFLocalizations.of(context).getVariableText(
                          //             enText: 'Please Enter Confirm Password.',
                          //             arText: 'الرجاء إدخال تأكيد كلمة المرور.',
                          //             zh_HansText: '请输入确认密码',
                          //             frText:
                          //             'Veuillez saisir le mot de passe confirmé.',
                          //             deText:
                          //             'Bitte geben Sie das Bestätigungskennwort ein.',
                          //             ptText:
                          //             'Por favor, insira a confirmação da senha.',
                          //             ruText:
                          //             'Пожалуйста, введите подтверждение пароля.',
                          //             esText:
                          //             'Por favor ingrese Confirmar contraseña.',
                          //             trText: 'Lütfen Şifreyi Doğrulayın.',
                          //           ),
                          //           FlutterFlowTheme.of(context).error,
                          //         );
                          //       }
                          //     } else {
                          //       await actions.customSnackbar(
                          //         context,
                          //         FFLocalizations.of(context).getVariableText(
                          //           enText: 'Please Enter New Password.',
                          //           arText:
                          //           'الرجاء إدخال كلمة المرور الجديدة أولاً.',
                          //           zh_HansText: '请先输入新密码。',
                          //           frText:
                          //           'Veuillez d\'abord saisir un nouveau mot de passe.',
                          //           deText:
                          //           'Bitte geben Sie zuerst ein neues Passwort ein.',
                          //           ptText:
                          //           'Bitte geben Sie zuerst ein neues Passwort ein.',
                          //           ruText:
                          //           'Пожалуйста, сначала введите новый пароль.',
                          //           esText:
                          //           'Ingrese primero la nueva contraseña.',
                          //           trText: 'Lütfen Önce Yeni Şifrenizi Girin.',
                          //         ),
                          //         FlutterFlowTheme.of(context).error,
                          //       );
                          //     }
                          //   } else {
                          //     await actions.customSnackbar(
                          //       context,
                          //       FFLocalizations.of(context).getVariableText(
                          //         enText: 'Please Enter Password.',
                          //         arText: 'الرجاء إدخال كلمة المرور.',
                          //         zh_HansText: '请输入密码.',
                          //         frText: 'Veuillez entrer le mot de passe.',
                          //         deText: 'Bitte Passwort eingeben.',
                          //         ptText: 'Por favor, digite a senha.',
                          //         ruText: 'Пожалуйста введите пароль.',
                          //         esText: 'Por favor, ingrese contraseña.',
                          //         trText: 'Lütfen şifre giriniz.',
                          //       ),
                          //       FlutterFlowTheme.of(context).error,
                          //     );
                          //   }
                          // }

                          ///For Regular
                          if (_model.currentPasswordController.text != '') {
                            if (_model.newPasswordController.text != '') {
                              if (_model.confirmPasswordController.text != '') {
                                if (_model.newPasswordController.text ==
                                    _model.confirmPasswordController.text) {
                                  _model.apiResult141 =
                                      await VcardGroup.changePasswordCall.call(
                                    authToken: FFAppState().authToken,
                                    email: FFAppState().email,
                                    oldPassword:
                                        _model.currentPasswordController.text,
                                    newPassword:
                                        _model.newPasswordController.text,
                                    confirmPassword:
                                        _model.confirmPasswordController.text,
                                  );
                                  if ((_model.apiResult141?.succeeded ??
                                      true)) {
                                    context.safePop();
                                    await actions.customSnackbar(
                                      context,
                                      FFLocalizations.of(context)
                                          .getVariableText(
                                        enText:
                                            'Password Changed Successfully.',
                                        arText: 'تم تغيير الرقم السري بنجاح.',
                                        zh_HansText: '密码修改成功',
                                        frText:
                                            'Le mot de passe a été changé avec succès.',
                                        deText:
                                            'Das Passwort wurde erfolgreich geändert.',
                                        ptText: 'Senha alterada com sucesso.',
                                        ruText: 'Пароль успешно изменен.',
                                        esText:
                                            'Contraseña cambiada con éxito.',
                                        trText:
                                            'Parola başarıyla değiştirildi.',
                                      ),
                                      const Color(0xFF46A44D),
                                    );
                                  } else {
                                    await actions.customSnackbar(
                                      context,
                                      FFLocalizations.of(context)
                                          .getVariableText(
                                        enText: 'Password change failed.',
                                        arText: 'فشل تغيير كلمة المرور',
                                        zh_HansText: '修改密码失败',
                                        frText:
                                            'La modification du mot de passe a échoué',
                                        deText:
                                            'Passwortänderung fehlgeschlagen',
                                        ptText: 'Falha na alteração da senha',
                                        ruText: 'Смена пароля не удалась',
                                        esText:
                                            'Error al cambiar la contraseña',
                                        trText:
                                            'Şifre değiştirme başarısız oldu',
                                      ),
                                      FlutterFlowTheme.of(context).error,
                                    );
                                  }
                                } else {
                                  await actions.customSnackbar(
                                    context,
                                    FFLocalizations.of(context).getVariableText(
                                      enText: 'Please enter correct password.',
                                      arText:
                                          'الرجاء إدخال كلمة المرور الصحيحة.',
                                      zh_HansText: '请输入正确的密码',
                                      frText:
                                          'Veuillez saisir le mot de passe correct.',
                                      deText:
                                          'Bitte geben Sie das richtige Passwort ein.',
                                      ptText:
                                          'Por favor insira a senha correta.',
                                      ruText:
                                          'Пожалуйста, введите правильный пароль.',
                                      esText:
                                          'Por favor ingrese la contraseña correcta.',
                                      trText: 'Lütfen doğru şifreyi girin.',
                                    ),
                                    FlutterFlowTheme.of(context).error,
                                  );
                                }
                              } else {
                                await actions.customSnackbar(
                                  context,
                                  FFLocalizations.of(context).getVariableText(
                                    enText: 'Please Enter Confirm Password.',
                                    arText: 'الرجاء إدخال تأكيد كلمة المرور.',
                                    zh_HansText: '请输入确认密码',
                                    frText:
                                        'Veuillez saisir le mot de passe confirmé.',
                                    deText:
                                        'Bitte geben Sie das Bestätigungskennwort ein.',
                                    ptText:
                                        'Por favor, insira a confirmação da senha.',
                                    ruText:
                                        'Пожалуйста, введите подтверждение пароля.',
                                    esText:
                                        'Por favor ingrese Confirmar contraseña.',
                                    trText: 'Lütfen Şifreyi Doğrulayın.',
                                  ),
                                  FlutterFlowTheme.of(context).error,
                                );
                              }
                            } else {
                              await actions.customSnackbar(
                                context,
                                FFLocalizations.of(context).getVariableText(
                                  enText: 'Please Enter New Password.',
                                  arText:
                                      'الرجاء إدخال كلمة المرور الجديدة أولاً.',
                                  zh_HansText: '请先输入新密码。',
                                  frText:
                                      'Veuillez d\'abord saisir un nouveau mot de passe.',
                                  deText:
                                      'Bitte geben Sie zuerst ein neues Passwort ein.',
                                  ptText:
                                      'Bitte geben Sie zuerst ein neues Passwort ein.',
                                  ruText:
                                      'Пожалуйста, сначала введите новый пароль.',
                                  esText:
                                      'Ingrese primero la nueva contraseña.',
                                  trText: 'Lütfen Önce Yeni Şifrenizi Girin.',
                                ),
                                FlutterFlowTheme.of(context).error,
                              );
                            }
                          } else {
                            await actions.customSnackbar(
                              context,
                              FFLocalizations.of(context).getVariableText(
                                enText: 'Please Enter Password.',
                                arText: 'الرجاء إدخال كلمة المرور.',
                                zh_HansText: '请输入密码.',
                                frText: 'Veuillez entrer le mot de passe.',
                                deText: 'Bitte Passwort eingeben.',
                                ptText: 'Por favor, digite a senha.',
                                ruText: 'Пожалуйста введите пароль.',
                                esText: 'Por favor, ingrese contraseña.',
                                trText: 'Lütfen şifre giriniz.',
                              ),
                              FlutterFlowTheme.of(context).error,
                            );
                          }
                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          '9jxexqm3' /* Save */,
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
                          '6dvjt0n2' /* Cancel */,
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
