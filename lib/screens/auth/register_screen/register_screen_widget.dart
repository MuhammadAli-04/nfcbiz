import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register_screen_model.dart';
export 'register_screen_model.dart';

class RegisterScreenWidget extends StatefulWidget {
  const RegisterScreenWidget({super.key});

  @override
  State<RegisterScreenWidget> createState() => _RegisterScreenWidgetState();
}

class _RegisterScreenWidgetState extends State<RegisterScreenWidget> {
  late RegisterScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.height = MediaQuery.sizeOf(context).height;
      });
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.firstNameController ??= TextEditingController();
    _model.firstNameFocusNode ??= FocusNode();

    _model.lastNameController ??= TextEditingController();
    _model.lastNameFocusNode ??= FocusNode();

    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    _model.confirmPasswordController ??= TextEditingController();
    _model.confirmPasswordFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/BG_(2).png',
                ).image,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.15,
                      decoration: const BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'cgei5bnd' /* Register Account */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito Sans',
                            fontSize: 26.0,
                            fontWeight: FontWeight.w800,
                            useGoogleFonts:
                                GoogleFonts.asMap().containsKey('Nunito Sans'),
                          ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'yqqtpp25' /* Please enter your details */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito Sans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16.0,
                            useGoogleFonts:
                                GoogleFonts.asMap().containsKey('Nunito Sans'),
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 40.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.firstNameController,
                        focusNode: _model.firstNameFocusNode,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.black,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            '9ni1jqov' /* Enter Your First Name */,
                          ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x0079818A),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF6F8F9),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF6F8F9),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.firstNameControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 15.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.lastNameController,
                        focusNode: _model.lastNameFocusNode,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.black,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'qf8w78qo' /* Enter Your Last Name */,
                          ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x0079818A),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF6F8F9),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF6F8F9),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.lastNameControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 15.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.emailController,
                        focusNode: _model.emailFocusNode,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.black,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'esxemusr' /* Enter Your Email */,
                          ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x0079818A),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF6F8F9),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF6F8F9),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.emailControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 15.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.passwordController,
                        focusNode: _model.passwordFocusNode,
                        textInputAction: TextInputAction.next,
                        obscureText: !_model.passwordVisibility,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.black,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'wgvyzwvt' /* Enter Your Password */,
                          ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x0079818A),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF6F8F9),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF6F8F9),
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => _model.passwordVisibility =
                                  !_model.passwordVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              _model.passwordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: const Color(0xFF79818A),
                              size: 20.0,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.passwordControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 15.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.confirmPasswordController,
                        focusNode: _model.confirmPasswordFocusNode,
                        textInputAction: TextInputAction.done,
                        obscureText: !_model.confirmPasswordVisibility,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.black,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'obbyo86y' /* Enter Your Confirm Password */,
                          ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x0079818A),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF6F8F9),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF6F8F9),
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
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 50.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if ((_model.firstNameController.text != '') &&
                              functions.textFieldValidator(
                                  _model.firstNameController.text)) {
                            if ((_model.lastNameController.text != '') &&
                                functions.textFieldValidator(
                                    _model.lastNameController.text)) {
                              if ((_model.emailController.text != '') &&
                                  functions.textFieldValidator(
                                      _model.emailController.text)) {
                                _model.emailRes = await actions.emailValidation(
                                  _model.emailController.text,
                                );
                                if (_model.emailRes!) {
                                  if ((_model.passwordController.text != '') &&
                                      functions.textFieldValidator(
                                          _model.passwordController.text)) {
                                    if ((_model.confirmPasswordController
                                                .text !=
                                            '') &&
                                        functions.textFieldValidator(_model
                                            .confirmPasswordController.text)) {
                                      if (_model.passwordController.text ==
                                          _model
                                              .confirmPasswordController.text) {
                                        _model.registerRes =
                                            await VcardGroup.registerCall.call(
                                          firstName:
                                              _model.firstNameController.text,
                                          lastName:
                                              _model.lastNameController.text,
                                          email: _model.emailController.text,
                                          password:
                                              _model.passwordController.text,
                                        );
                                        if ((_model.registerRes?.succeeded ??
                                            true)) {
                                          context.pushNamed(
                                            'login_screen',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 400),
                                              ),
                                            },
                                          );

                                          await actions.customSnackbar(
                                            context,
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                              enText:
                                                  'Registration successfully.',
                                              arText: 'تم التسجيل بنجاح.',
                                              zh_HansText: '注册成功',
                                              frText: 'Inscription réussie.',
                                              deText:
                                                  ' Registrierung erfolgreich.',
                                              ptText: ' Registro com sucesso.',
                                              ruText:
                                                  'Регистрация прошла успешно.',
                                              esText: 'Registro exitoso.',
                                              trText: 'Kayıt başarıyla.',
                                            ),
                                            const Color(0xFF46A44D),
                                          );
                                        } else {
                                          await actions.customSnackbar(
                                            context,
                                            valueOrDefault<String>(
                                              getJsonField(
                                                (_model.registerRes?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              )?.toString(),
                                              'Registration failed.',
                                            ),
                                            FlutterFlowTheme.of(context).error,
                                          );
                                        }
                                      } else {
                                        await actions.customSnackbar(
                                          context,
                                          FFLocalizations.of(context)
                                              .getVariableText(
                                            enText:
                                                'Please Enter Valid Password.',
                                            arText:
                                                'الرجاء إدخال كلمة مرور صالحة.',
                                            zh_HansText: '请输入有效密码',
                                            frText:
                                                'Veuillez saisir un mot de passe valide.',
                                            deText:
                                                'Bitte geben Sie ein gültiges Passwort ein.',
                                            ptText: 'Digite uma senha válida.',
                                            ruText:
                                                'Пожалуйста, введите действительный пароль.',
                                            esText:
                                                'Por favor ingrese una contraseña válida.',
                                            trText:
                                                'Lütfen Geçerli Şifre Giriniz.',
                                          ),
                                          FlutterFlowTheme.of(context).error,
                                        );
                                      }
                                    } else {
                                      await actions.customSnackbar(
                                        context,
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText:
                                              'Please Enter Confirm Password.',
                                          arText:
                                              'الرجاء إدخال تأكيد كلمة المرور.',
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
                                      FFLocalizations.of(context)
                                          .getVariableText(
                                        enText: 'Please Enter  Password.',
                                        arText: 'الرجاء إدخال كلمة المرور.',
                                        zh_HansText: '请输入密码.',
                                        frText:
                                            'Veuillez entrer le mot de passe.',
                                        deText: 'Bitte Passwort eingeben.',
                                        ptText: 'Por favor, digite a senha.',
                                        ruText: 'Пожалуйста введите пароль.',
                                        esText:
                                            'Por favor, ingrese contraseña.',
                                        trText: 'Lütfen şifre giriniz.',
                                      ),
                                      FlutterFlowTheme.of(context).error,
                                    );
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
                                await actions.customSnackbar(
                                  context,
                                  FFLocalizations.of(context).getVariableText(
                                    enText: 'Please Enter Email.',
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
                              await actions.customSnackbar(
                                context,
                                FFLocalizations.of(context).getVariableText(
                                  enText: 'Please Enter Last name.',
                                  arText: 'الرجاء إدخال الاسم الأخير.',
                                  zh_HansText: '请输入姓氏',
                                  frText:
                                      'Veuillez saisir votre nom de famille.',
                                  deText: 'Bitte geben Sie den Nachnamen ein.',
                                  ptText: 'Lütfen Soyadınızı Giriniz.',
                                  ruText: 'Lütfen Soyadınızı Giriniz.',
                                  esText: 'Lütfen Soyadınızı Giriniz.',
                                  trText: 'Lütfen Soyadınızı Giriniz.',
                                ),
                                FlutterFlowTheme.of(context).error,
                              );
                            }
                          } else {
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
                          }

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          '1cnl5cer' /* Register */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
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
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 45.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '0duuerwu' /* Already have an Account? */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 12.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            'login_screen',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300),
                              ),
                            },
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'z8plp0bu' /* Login */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFFE9F0FF),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Nunito Sans',
                                    color: const Color(0xFFE4BB31),
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
                  ].addToEnd(SizedBox(
                      height: (isWeb
                              ? MediaQuery.viewInsetsOf(context).bottom > 0
                              : _isKeyboardVisible)
                          ? 300.0
                          : 20.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
