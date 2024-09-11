import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_screen_model.dart';
export 'login_screen_model.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({super.key});

  @override
  State<LoginScreenWidget> createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  late LoginScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginScreenModel());

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

    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();
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
    context.watch<FFAppState>();

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
            height: _model.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                alignment: const AlignmentDirectional(0.0, 0.0),
                image: Image.asset(
                  'assets/images/BG_(2).png',
                ).image,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
              child: ListView(
                padding: EdgeInsets.fromLTRB(
                  0,
                  100.0,
                  0,
                  (isWeb
                          ? MediaQuery.viewInsetsOf(context).bottom > 0
                          : _isKeyboardVisible)
                      ? 300.0
                      : 20.0,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/login_vector.png',
                        height: MediaQuery.sizeOf(context).height * 0.25,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 30.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'th4sex5e' /* Welcome, */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito Sans',
                            fontSize: 26.0,
                            fontWeight: FontWeight.w800,
                            useGoogleFonts:
                                GoogleFonts.asMap().containsKey('Nunito Sans'),
                          ),
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'l0fds6fb' /* Sign In to continue */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 18.0,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Nunito Sans'),
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 30.0, 0.0, 0.0),
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
                          'imh1zi9g' /* Email Address */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                      keyboardType: TextInputType.emailAddress,
                      validator:
                          _model.emailControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 10.0, 0.0, 0.0),
                    child: TextFormField(
                      controller: _model.passwordController,
                      focusNode: _model.passwordFocusNode,
                      textInputAction: TextInputAction.done,
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
                          '497bukjd' /* Password */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x0079818A),
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFF6F8F9),
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 0.0,
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
                  Align(
                    alignment: const AlignmentDirectional(1.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 8.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          // context.pushNamed(
                          //   'forgot_password_screen',
                          //   extra: <String, dynamic>{
                          //     kTransitionInfoKey: const TransitionInfo(
                          //       hasTransition: true,
                          //       transitionType: PageTransitionType.fade,
                          //       duration: Duration(milliseconds: 300),
                          //     ),
                          //   },
                          // );

                          await launchURL(
                              "https://dashboard.nfcbiz.com/forgot-password",
                              context);
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'ycnv65i3' /* Forgot Password? */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    color: const Color(0xFFE4BB31),
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 50.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Function() navigate = () {};
                        if ((_model.emailController.text != '') &&
                            (_model.passwordController.text != '')) {
                          _model.apiResult88p = await VcardGroup.loginCall.call(
                            email: _model.emailController.text,
                            password: _model.passwordController.text,
                          );
                          if ((_model.apiResult88p?.succeeded ?? true)) {
                            if (getJsonField(
                              (_model.apiResult88p?.jsonBody ?? ''),
                              r'''$.success''',
                            )) {
                              setState(() {
                                FFAppState().authToken = getJsonField(
                                  (_model.apiResult88p?.jsonBody ?? ''),
                                  r'''$.data.token''',
                                ).toString();
                                FFAppState().email =
                                    _model.emailController.text;
                                FFAppState().role = getJsonField(
                                  (_model.apiResult88p?.jsonBody ?? ''),
                                  r'''$.data.role''',
                                ).toString();
                                FFAppState().selectedDrawerPage = 'Dashboard';
                              });
                              _model.profileRes =
                                  await VcardGroup.profileCall.call(
                                authToken: getJsonField(
                                  (_model.apiResult88p?.jsonBody ?? ''),
                                  r'''$.data.token''',
                                ).toString(),
                              );
                              if ((_model.profileRes?.succeeded ?? true)) {
                                if (VcardGroup.profileCall.language(
                                      (_model.profileRes?.jsonBody ?? ''),
                                    ) ==
                                    'Arabic') {
                                  setAppLanguage(context, 'ar');
                                  setState(() {
                                    FFAppState().selectLanguageIndex = 0;
                                  });
                                } else {
                                  if (VcardGroup.profileCall.language(
                                        (_model.profileRes?.jsonBody ?? ''),
                                      ) ==
                                      'Chinese') {
                                    setAppLanguage(context, 'zh_Hans');
                                    setState(() {
                                      FFAppState().selectLanguageIndex = 1;
                                    });
                                  } else {
                                    if (VcardGroup.profileCall.language(
                                          (_model.profileRes?.jsonBody ?? ''),
                                        ) ==
                                        'English') {
                                      setAppLanguage(context, 'en');
                                      setState(() {
                                        FFAppState().selectLanguageIndex = 2;
                                      });
                                    } else {
                                      if (VcardGroup.profileCall.language(
                                            (_model.profileRes?.jsonBody ?? ''),
                                          ) ==
                                          'French') {
                                        setAppLanguage(context, 'fr');
                                        setState(() {
                                          FFAppState().selectLanguageIndex = 3;
                                        });
                                      } else {
                                        if (VcardGroup.profileCall.language(
                                              (_model.profileRes?.jsonBody ??
                                                  ''),
                                            ) ==
                                            'German') {
                                          setAppLanguage(context, 'de');
                                          setState(() {
                                            FFAppState().selectLanguageIndex =
                                                4;
                                          });
                                        } else {
                                          if (VcardGroup.profileCall.language(
                                                (_model.profileRes?.jsonBody ??
                                                    ''),
                                              ) ==
                                              'Portuguese') {
                                            setAppLanguage(context, 'pt');
                                            setState(() {
                                              FFAppState().selectLanguageIndex =
                                                  5;
                                            });
                                          } else {
                                            if (VcardGroup.profileCall.language(
                                                  (_model.profileRes
                                                          ?.jsonBody ??
                                                      ''),
                                                ) ==
                                                'Russian') {
                                              setAppLanguage(context, 'ru');
                                              setState(() {
                                                FFAppState()
                                                    .selectLanguageIndex = 6;
                                              });
                                            } else {
                                              if (VcardGroup.profileCall
                                                      .language(
                                                    (_model.profileRes
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                  'Spanish') {
                                                setAppLanguage(context, 'es');
                                                setState(() {
                                                  FFAppState()
                                                      .selectLanguageIndex = 7;
                                                });
                                              } else {
                                                if (VcardGroup.profileCall
                                                        .language(
                                                      (_model.profileRes
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) ==
                                                    'Turkish') {
                                                  setAppLanguage(context, 'tr');
                                                  setState(() {
                                                    FFAppState()
                                                        .selectLanguageIndex = 8;
                                                  });
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              } else {
                                await actions.customSnackbar(
                                  context,
                                  FFLocalizations.of(context).getVariableText(
                                    enText: 'Profile Error.',
                                    arText: 'خطأ في اسم المستخدم أو كلمة مرور.',
                                    zh_HansText: '用户名或密码无效.',
                                    frText:
                                        'Nom d\'utilisateur ou mot de passe invalide.',
                                    deText:
                                        'Ungültiger Benutzername oder Passwort.',
                                    ptText:
                                        'Nome de usuário ou senha inválidos.',
                                    ruText: 'Неправильное имя  или пароль.',
                                    esText: 'Usuario o contraseña invalido.',
                                    trText:
                                        'Geçersiz kullanıcı adı veya şifre.',
                                  ),
                                  FlutterFlowTheme.of(context).error,
                                );
                              }

                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signIn(
                                authenticationToken: FFAppState().authToken,
                              );
                              navigate = () => context.goNamedAuth(
                                  'dashboard', context.mounted);
                              await actions.customSnackbar(
                                context,
                                'Login Successfully.',
                                const Color(0xFF46A44D),
                              );
                            } else {
                              setState(() {
                                _model.emailController?.clear();
                              });
                              await actions.customSnackbar(
                                context,
                                getJsonField(
                                  (_model.apiResult88p?.jsonBody ?? ''),
                                  r'''$.message''',
                                ).toString(),
                                FlutterFlowTheme.of(context).error,
                              );
                            }
                          } else {
                            await actions.customSnackbar(
                              context,
                              getJsonField(
                                (_model.apiResult88p?.jsonBody ?? ''),
                                r'''$.message''',
                              ).toString(),
                              FlutterFlowTheme.of(context).error,
                            );
                          }
                        } else {
                          if (_model.emailController.text == '') {
                            await actions.customSnackbar(
                              context,
                              FFLocalizations.of(context).getVariableText(
                                enText: 'Enter Email First.',
                                arText: 'أدخل البريد الإلكتروني أولا.',
                                zh_HansText: '首先输入电子邮件.',
                                frText: 'Entrez d\'abord l\'e-mail.',
                                deText:
                                    'Geben Sie zuerst die E-Mail-Adresse ein.',
                                ptText: 'Digite o e-mail primeiro.',
                                ruText:
                                    'Сначала введите адрес электронной почты.',
                                esText:
                                    'Ingrese el correo electrónico primero.',
                                trText: 'Önce E-postayı Girin.',
                              ),
                              FlutterFlowTheme.of(context).error,
                            );
                          } else {
                            await actions.customSnackbar(
                              context,
                              FFLocalizations.of(context).getVariableText(
                                enText: 'Enter Password First.',
                                arText: 'أدخل كلمة المرور أولا.',
                                zh_HansText: ' 首先输入密码.',
                                frText: ' Entrez d\'abord le mot de passe.',
                                deText: 'Geben Sie zuerst das Passwort ein.',
                                ptText: ' Digite a senha primeiro.',
                                ruText: 'Сначала введите пароль.',
                                esText: 'Ingrese la contraseña primero.',
                                trText: ' Önce Şifreyi Girin.',
                              ),
                              FlutterFlowTheme.of(context).error,
                            );
                          }
                        }

                        navigate();

                        setState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'bltmxua3' /* Login */,
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
                          'anao6v0h' /* Don't have an Account? */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                        // context.pushNamed(
                        //   'register_screen',
                        //   extra: <String, dynamic>{
                        //     kTransitionInfoKey: const TransitionInfo(
                        //       hasTransition: true,
                        //       transitionType: PageTransitionType.fade,
                        //       duration: Duration(milliseconds: 300),
                        //     ),
                        //   },
                        // );
                        await launchURL(
                            "https://dashboard.nfcbiz.com/register", context);
                      },
                      text: FFLocalizations.of(context).getText(
                        'nnbrrxo7' /* Register */,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
