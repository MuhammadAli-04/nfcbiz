import '/backend/api_requests/api_calls.dart';
import '/component/drawer/drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'setting_screen_model.dart';
export 'setting_screen_model.dart';

class SettingScreenWidget extends StatefulWidget {
  const SettingScreenWidget({super.key});

  @override
  State<SettingScreenWidget> createState() => _SettingScreenWidgetState();
}

class _SettingScreenWidgetState extends State<SettingScreenWidget> {
  late SettingScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().isLoading = true;
      });
      await Future.delayed(const Duration(milliseconds: 5000));
      setState(() {
        FFAppState().isLoading = false;
      });
    });
  }

  updateSetting() async {
    _model.affiliationOnRes = await VcardGroup.settingUpdateCall.call(
      authToken: FFAppState().authToken,
      enableAffiliation: _model.switchValue1 == true ? '1' : '0',
      enableContact: _model.switchValue2 == true ? '1' : '0',
      hideStickybar: _model.switchValue3 == true ? '1' : '0',
      whatsappShare: _model.switchValue4 == true ? '1' : '0',
      timeFormat: null,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    updateSetting();
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
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.drawerModel,
            updateCallback: () => setState(() {}),
            child: const DrawerWidget(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              scaffoldKey.currentState!.openDrawer();
            },
            child: Container(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    12.0, 17.0, 25.0, 17.0),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: const Color(0x00FFFFFF),
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      image: Image.asset(
                        'assets/images/drawer.png',
                      ).image,
                    ),
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '2vqrk4yt' /* Settings */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Nunito Sans',
                  color: Colors.black,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts:
                      GoogleFonts.asMap().containsKey('Nunito Sans'),
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder<ApiCallResponse>(
                      future: VcardGroup.profileCall.call(
                        authToken: FFAppState().authToken,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        final columnProfileResponse = snapshot.data!;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(50.0),
                                  bottomRight: Radius.circular(50.0),
                                  topLeft: Radius.circular(50.0),
                                  topRight: Radius.circular(50.0),
                                ),
                                child: (VcardGroup.profileCall.image(
                                          columnProfileResponse.jsonBody,
                                        ) !=
                                        null)
                                    ? Image.network(
                                        VcardGroup.profileCall.image(
                                          columnProfileResponse.jsonBody,
                                        )!,
                                        width: 90.0,
                                        height: 90.0,
                                        fit: BoxFit.cover,
                                      )
                                    : const SizedBox(
                                        width: 90.0,
                                        height: 90.0,
                                      ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  VcardGroup.profileCall.firstName(
                                    columnProfileResponse.jsonBody,
                                  ),
                                  'firstName',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Nunito Sans'),
                                    ),
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                VcardGroup.profileCall.email(
                                  columnProfileResponse.jsonBody,
                                ),
                                'email',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: const Color(0xFF79818A),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'edit_profile_screen',
                                    queryParameters: {
                                      'profileData': serializeParam(
                                        getJsonField(
                                          columnProfileResponse.jsonBody,
                                          r'''$.data[0]''',
                                        ),
                                        ParamType.JSON,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 300),
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.38,
                                  height: 35.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE4BB31),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  alignment:
                                      const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'mg8rhguv' /* Edit Profile */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts:
                                                    GoogleFonts.asMap()
                                                        .containsKey(
                                                            'Nunito Sans'),
                                              ),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.white,
                                            size: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'y9n16027' /* Language */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Nunito Sans'),
                                        ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'language_screen',
                                        queryParameters: {
                                          'isChange': serializeParam(
                                            true,
                                            ParamType.bool,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey:
                                              const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 300),
                                          ),
                                        },
                                      );

                                      if (VcardGroup.profileCall.language(
                                            columnProfileResponse.jsonBody,
                                          ) ==
                                          'Arabic') {
                                        setState(() {
                                          FFAppState().selectLanguageIndex = 0;
                                        });
                                      } else {
                                        if (VcardGroup.profileCall.language(
                                              columnProfileResponse.jsonBody,
                                            ) ==
                                            'Chinese') {
                                          setState(() {
                                            FFAppState().selectLanguageIndex =
                                                1;
                                          });
                                        } else {
                                          if (VcardGroup.profileCall.language(
                                                columnProfileResponse.jsonBody,
                                              ) ==
                                              'English') {
                                            setState(() {
                                              FFAppState().selectLanguageIndex =
                                                  2;
                                            });
                                          } else {
                                            if (VcardGroup.profileCall.language(
                                                  columnProfileResponse
                                                      .jsonBody,
                                                ) ==
                                                'French') {
                                              setState(() {
                                                FFAppState()
                                                    .selectLanguageIndex = 3;
                                              });
                                            } else {
                                              if (VcardGroup.profileCall
                                                      .language(
                                                    columnProfileResponse
                                                        .jsonBody,
                                                  ) ==
                                                  'German') {
                                                setState(() {
                                                  FFAppState()
                                                      .selectLanguageIndex = 4;
                                                });
                                              } else {
                                                if (VcardGroup.profileCall
                                                        .language(
                                                      columnProfileResponse
                                                          .jsonBody,
                                                    ) ==
                                                    'Portuguese') {
                                                  setState(() {
                                                    FFAppState()
                                                        .selectLanguageIndex = 5;
                                                  });
                                                } else {
                                                  if (VcardGroup.profileCall
                                                          .language(
                                                        columnProfileResponse
                                                            .jsonBody,
                                                      ) ==
                                                      'Russian') {
                                                    setState(() {
                                                      FFAppState()
                                                          .selectLanguageIndex = 6;
                                                    });
                                                  } else {
                                                    if (VcardGroup.profileCall
                                                            .language(
                                                          columnProfileResponse
                                                              .jsonBody,
                                                        ) ==
                                                        'Spanish') {
                                                      setState(() {
                                                        FFAppState()
                                                            .selectLanguageIndex = 7;
                                                      });
                                                    } else {
                                                      if (VcardGroup.profileCall
                                                              .language(
                                                            columnProfileResponse
                                                                .jsonBody,
                                                          ) ==
                                                          'Turkish') {
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
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            VcardGroup.profileCall.language(
                                              columnProfileResponse.jsonBody,
                                            ),
                                            'language',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                color: const Color(0xFF79818A),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts:
                                                    GoogleFonts.asMap()
                                                        .containsKey(
                                                            'Nunito Sans'),
                                              ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(10.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 1.0,
                              color: Color(0xFFAAB0B8),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'change_password_screen',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 300),
                                      ),
                                    },
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'i7c0zshr' /* Change Password */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Nunito Sans'),
                                          ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (FFAppState().role == 'Super Admin')
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Divider(
                                    thickness: 1.0,
                                    color: Color(0xFFAAB0B8),
                                  ),
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 8.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'bffc42n1' /* Manually Payment */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 16.0,
                                              color: Colors.black,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          'Nunito Sans'),
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                    child: custom_widgets.QuillWidget(
                                      width: double.infinity,
                                      height: 250.0,
                                      htmlData: getJsonField(
                                        columnProfileResponse.jsonBody,
                                        r'''$.data[0].manual_payment_guide''',
                                      ).toString(),
                                      isEnable: true,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.apiResultrga = await VcardGroup
                                            .profileUpdateCall
                                            .call(
                                          authToken: FFAppState().authToken,
                                          manualPaymentGuide:
                                              FFAppState().manualPaymentGuide,
                                          profile: const FFUploadedFile(),
                                          firstName:
                                              VcardGroup.profileCall.firstName(
                                            columnProfileResponse.jsonBody,
                                          ),
                                          contact:
                                              VcardGroup.profileCall.contact(
                                            columnProfileResponse.jsonBody,
                                          ),
                                          regionCode:
                                              VcardGroup.profileCall.regionCode(
                                            columnProfileResponse.jsonBody,
                                          ),
                                          email: VcardGroup.profileCall.email(
                                            columnProfileResponse.jsonBody,
                                          ),
                                          lastName:
                                              VcardGroup.profileCall.lastName(
                                            columnProfileResponse.jsonBody,
                                          ),
                                        );
                                        if ((_model.apiResultrga?.succeeded ??
                                            true)) {
                                          await actions.customSnackbar(
                                            context,
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                              enText:
                                                  'Manual Payment Guide Update Successfully.',
                                              arText:
                                                  ' تحديث دليل الدفع اليدوي بنجاح.',
                                              zh_HansText: '手动付款指南更新成功.',
                                              frText:
                                                  'Mise à jour réussie du guide de paiement manuel.',
                                              deText:
                                                  'Erfolgreiche Aktualisierung Zahlungshandbuchs.',
                                              ptText:
                                                  'Atualização do guia de pagamento manual realizada com sucesso.',
                                              ruText:
                                                  'Руководство по ручным платежам успешно обновлено.',
                                              esText:
                                                  'Actualización exitosa del manual de pagos.',
                                              trText:
                                                  'Manuel Ödeme Kılavuzu Başarıyla Güncellendi.',
                                            ),
                                            const Color(0xFF46A44D),
                                          );
                                        } else {
                                          await actions.customSnackbar(
                                            context,
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                              enText:
                                                  'Manual Payment Guide Update failed.',
                                              arText:
                                                  'فشل تحديث دليل الدفع اليدوي.',
                                              zh_HansText: '手动付款指南更新失败.',
                                              frText:
                                                  'Échec de la mise à jour du guide de paiement manuel.',
                                              deText:
                                                  'Aktualisierung des manuellen Zahlungshandbuchs.',
                                              ptText:
                                                  'Falha na atualização do guia de pagamento manual.',
                                              ruText:
                                                  'Обновление руководства по ручным платежам не удалось.',
                                              esText:
                                                  'Falló la actualización del manual de pagos.',
                                              trText:
                                                  'Manuel Ödeme Kılavuzu Güncelleme Başarısız.',
                                            ),
                                            FlutterFlowTheme.of(context).error,
                                          );
                                        }

                                        setState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'we4xgr71' /* Save */,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 50.0,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(24.0, 0.0, 24.0, 0.0),
                                        iconPadding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFFE4BB31),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          'Nunito Sans'),
                                            ),
                                        elevation: 0.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        );
                      },
                    ),
                    Builder(
                      builder: (context) {
                        if (FFAppState().role == 'Admin') {
                          return FutureBuilder<ApiCallResponse>(
                            future: VcardGroup.settingsCall.call(
                              authToken: FFAppState().authToken,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final columnSettingsResponse = snapshot.data!;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Divider(
                                    thickness: 1.0,
                                    color: Color(0xFFAAB0B8),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'lgxuhg43' /* Enable Affiliation */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          'Nunito Sans'),
                                            ),
                                      ),
                                      Switch.adaptive(
                                        value: _model.switchValue1 ??=
                                            VcardGroup.settingsCall
                                                    .enableAffiliation(
                                                  columnSettingsResponse
                                                      .jsonBody,
                                                ) ==
                                                '1',
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue1 = newValue);
                                        },
                                        activeColor: const Color(0xFFE4BB31),
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 1.0,
                                    color: Color(0xFFAAB0B8),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'xcggpv4p' /* Enable Add to contact */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          'Nunito Sans'),
                                            ),
                                      ),
                                      Switch.adaptive(
                                        value: _model.switchValue2 ??=
                                            VcardGroup.settingsCall
                                                    .enableContact(
                                                  columnSettingsResponse
                                                      .jsonBody,
                                                ) ==
                                                '1',
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue2 = newValue);
                                        },
                                        activeColor: const Color(0xFFE4BB31),
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 1.0,
                                    color: Color(0xFFAAB0B8),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'qbhjmxyf' /* Hide vCard Sticky Bar */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          'Nunito Sans'),
                                            ),
                                      ),
                                      Switch.adaptive(
                                        value: _model.switchValue3 ??=
                                            VcardGroup.settingsCall
                                                    .hideStickybar(
                                                  columnSettingsResponse
                                                      .jsonBody,
                                                ) ==
                                                '1',
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue3 = newValue);
                                        },
                                        activeColor: const Color(0xFFE4BB31),
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 1.0,
                                    color: Color(0xFFAAB0B8),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '0n5cykg2' /* WhatsApp Share */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          'Nunito Sans'),
                                            ),
                                      ),
                                      Switch.adaptive(
                                        value: _model.switchValue4 ??=
                                            VcardGroup.settingsCall
                                                    .whatsappShare(
                                                  columnSettingsResponse
                                                      .jsonBody,
                                                ) ==
                                                '1',
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue4 = newValue);
                                        },
                                        activeColor: const Color(0xFFE4BB31),
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 1.0,
                                    color: Color(0xFFAAB0B8),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            if (FFAppState().isLoading)
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: const Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: custom_widgets.CustomLoader(
                      width: 100.0,
                      height: 100.0,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
