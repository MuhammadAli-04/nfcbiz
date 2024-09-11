import '/backend/api_requests/api_calls.dart';
import '/component/add_group_component/add_group_component_widget.dart';
import '/component/delete_group_dialog_box/delete_group_dialog_box_widget.dart';
import '/component/empty_data_component/empty_data_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_group_dialog_box_model.dart';
export 'select_group_dialog_box_model.dart';

class SelectGroupDialogBoxWidget extends StatefulWidget {
  const SelectGroupDialogBoxWidget({super.key});

  @override
  State<SelectGroupDialogBoxWidget> createState() =>
      _SelectGroupDialogBoxWidgetState();
}

class _SelectGroupDialogBoxWidgetState
    extends State<SelectGroupDialogBoxWidget> {
  late SelectGroupDialogBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectGroupDialogBoxModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(
          maxHeight: 400.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50.0,
                    height: 35.0,
                    decoration: const BoxDecoration(),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'pav5knqn' /* Select Group */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Nunito Sans'),
                        ),
                  ),
                  Builder(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: const DeleteGroupDialogBoxWidget(),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      child: Container(
                        width: 70.0,
                        height: 30.0,
                        decoration: const BoxDecoration(),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'gwoconob' /* Remove */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: const Color(0xFFF35050),
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Nunito Sans'),
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Builder(
                        builder: (context) {
                          if (FFAppState().role == 'Super Admin') {
                            return FutureBuilder<ApiCallResponse>(
                              future: VcardGroup.groupsCall.call(
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                final columnGroupsResponse = snapshot.data!;
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        final data = VcardGroup.groupsCall
                                                .data(
                                                  columnGroupsResponse.jsonBody,
                                                )
                                                ?.toList() ??
                                            [];
                                        if (data.isEmpty) {
                                          return const EmptyDataComponentWidget();
                                        }
                                        return ListView.builder(
                                          padding: const EdgeInsets.fromLTRB(
                                            0,
                                            15.0,
                                            0,
                                            0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: data.length,
                                          itemBuilder: (context, dataIndex) {
                                            final dataItem = data[dataIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  FFAppState()
                                                          .selectedGroupIndex =
                                                      dataIndex;
                                                  FFAppState().SelectedGroupId =
                                                      getJsonField(
                                                    dataItem,
                                                    r'''$.id''',
                                                  );
                                                });
                                              },
                                              child: Container(
                                                decoration:
                                                    const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0,
                                                              0.0, 5.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              dataItem,
                                                              r'''$.name''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Nunito Sans'),
                                                                ),
                                                          ),
                                                          Container(
                                                            width: 18.0,
                                                            height: 18.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: dataIndex ==
                                                                      FFAppState()
                                                                          .selectedGroupIndex
                                                                  ? const Color(
                                                                      0xFFE4BB31)
                                                                  : const Color(
                                                                      0xFFAAB0B8),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 14.0,
                                                              height: 14.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: dataIndex ==
                                                                        FFAppState()
                                                                            .selectedGroupIndex
                                                                    ? const Color(
                                                                        0xFFE4BB31)
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                shape: BoxShape
                                                                    .circle,
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  width: 2.5,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const Divider(
                                                      height: 25.0,
                                                      thickness: 0.5,
                                                      color: Color(0xFFAAB0B8),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            debugPrint("authToken: ${FFAppState().authToken}");
                            return FutureBuilder<ApiCallResponse>(
                              future: VcardGroup.groupsCall.call(
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                final columnAdminGroupResponse = snapshot.data!;
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        final data = VcardGroup.adminGroupCall
                                                .data(
                                                  columnAdminGroupResponse
                                                      .jsonBody,
                                                )
                                                ?.toList() ??
                                            [];
                                        if (data.isEmpty) {
                                          return const EmptyDataComponentWidget();
                                        }
                                        return ListView.builder(
                                          padding: const EdgeInsets.fromLTRB(
                                            0,
                                            15.0,
                                            0,
                                            0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: data.length,
                                          itemBuilder: (context, dataIndex) {
                                            final dataItem = data[dataIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  FFAppState()
                                                          .selectedGroupIndex =
                                                      dataIndex;
                                                  FFAppState().SelectedGroupId =
                                                      getJsonField(
                                                    dataItem,
                                                    r'''$.id''',
                                                  );
                                                });
                                              },
                                              child: Container(
                                                decoration:
                                                    const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0,
                                                              0.0, 5.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              dataItem,
                                                              r'''$.name''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Nunito Sans'),
                                                                ),
                                                          ),
                                                          Container(
                                                            width: 18.0,
                                                            height: 18.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: dataIndex ==
                                                                      FFAppState()
                                                                          .selectedGroupIndex
                                                                  ? const Color(
                                                                      0xFFE4BB31)
                                                                  : const Color(
                                                                      0xFFAAB0B8),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 14.0,
                                                              height: 14.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: dataIndex ==
                                                                        FFAppState()
                                                                            .selectedGroupIndex
                                                                    ? const Color(
                                                                        0xFFE4BB31)
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                shape: BoxShape
                                                                    .circle,
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  width: 2.5,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const Divider(
                                                      height: 25.0,
                                                      thickness: 0.5,
                                                      color: Color(0xFFAAB0B8),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    Builder(
                                      builder: (context) => Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 2.0, 2.5, 0.0),
                                        child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.safePop();
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child:
                                                        AddGroupComponentWidget(
                                                      data: VcardGroup
                                                          .adminGroupCall
                                                          .data(
                                                        columnAdminGroupResponse
                                                            .jsonBody,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                            child: Container()),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (FFAppState().SelectedGroupId != 0) {
                      if (FFAppState().role == 'Super Admin') {
                        _model.superBusinesscardRes =
                            await VcardGroup.businessCardCall.call(
                          authToken: FFAppState().authToken,
                        );
                        _model.superadminGroup =
                            await VcardGroup.groupsCall.call(
                          authToken: FFAppState().authToken,
                        );
                      } else {
                        _model.adminBusinessRes =
                            await VcardGroup.adminBusinessCardCall.call(
                          authToken: FFAppState().authToken,
                        );
                        _model.adminGroup =
                            await VcardGroup.adminGroupCall.call(
                          authToken: FFAppState().authToken,
                        );
                      }

                      if (functions.businessCardValidator(
                              (FFAppState().role == 'Super Admin'
                                      ? VcardGroup.businessCardCall.data(
                                          (_model.superBusinesscardRes
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                      : VcardGroup.adminBusinessCardCall.data(
                                          (_model.adminBusinessRes?.jsonBody ??
                                              ''),
                                        )!)
                                  .toList(),
                              FFAppState().scannedURL,
                              (FFAppState().role == 'Super Admin'
                                      ? VcardGroup.groupsCall.data(
                                          (_model.superadminGroup?.jsonBody ??
                                              ''),
                                        )!
                                      : VcardGroup.adminGroupCall.data(
                                          (_model.adminGroup?.jsonBody ?? ''),
                                        )!)
                                  .toList()) ==
                          true) {
                        _model.apiResultzh2 =
                            await VcardGroup.businessCardCreateCall.call(
                          authToken: FFAppState().authToken,
                          urlAlias: FFAppState().scannedURL,
                          groupId: FFAppState().SelectedGroupId.toString(),
                        );
                        if ((_model.apiResultzh2?.succeeded ?? true)) {
                          if (FFAppState().isBusinessScreenSelected) {
                            if (FFAppState().role == 'Super Admin') {
                              _model.updatePage(() {
                                FFAppState().isAPILoading = true;
                              });
                              _model.groupRes1 =
                                  await VcardGroup.groupsCall.call(
                                authToken: FFAppState().authToken,
                              );
                              _model.businesscardRes1 =
                                  await VcardGroup.businessCardCall.call(
                                authToken: FFAppState().authToken,
                              );
                              FFAppState().update(() {
                                FFAppState().businessGroupList =
                                    VcardGroup.groupsCall
                                        .data(
                                          (_model.groupRes1?.jsonBody ?? ''),
                                        )!
                                        .toList()
                                        .cast<dynamic>();
                                FFAppState().businessCardList = VcardGroup
                                    .businessCardCall
                                    .data(
                                      (_model.businesscardRes1?.jsonBody ?? ''),
                                    )!
                                    .toList()
                                    .cast<dynamic>();
                              });
                              _model.updatePage(() {
                                FFAppState().isAPILoading = false;
                                FFAppState().isBusinessScreenSelected = false;
                              });
                            } else {
                              _model.updatePage(() {
                                FFAppState().isAPILoading = true;
                              });
                              _model.admingroupRes1 =
                                  await VcardGroup.adminGroupCall.call(
                                authToken: FFAppState().authToken,
                              );
                              _model.adminbusinesscardRes1 =
                                  await VcardGroup.adminBusinessCardCall.call(
                                authToken: FFAppState().authToken,
                              );
                              FFAppState().update(() {
                                FFAppState().businessGroupList = VcardGroup
                                    .adminGroupCall
                                    .data(
                                      (_model.admingroupRes1?.jsonBody ?? ''),
                                    )!
                                    .toList()
                                    .cast<dynamic>();
                                FFAppState().businessCardList = VcardGroup
                                    .adminBusinessCardCall
                                    .data(
                                      (_model.adminbusinesscardRes1?.jsonBody ??
                                          ''),
                                    )!
                                    .toList()
                                    .cast<dynamic>();
                              });
                              _model.updatePage(() {
                                FFAppState().isAPILoading = false;
                                FFAppState().isBusinessScreenSelected = false;
                              });
                            }
                          }
                          context.safePop();
                          await actions.customSnackbar(
                            context,
                            FFLocalizations.of(context).getVariableText(
                              enText: 'Business card add successfully.',
                              arText: 'تمت إضافة بطاقة العمل بنجاح.',
                              zh_HansText: '名片添加成功。',
                              frText: 'Carte de visite ajoutée avec succès.',
                              deText: 'Visitenkarte erfolgreich hinzugefügt.',
                              ptText:
                                  'Cartão de visita adicionado com sucesso.',
                              ruText: 'Визитка добавлена ​​успешно.',
                              esText:
                                  'La tarjeta de presentación se agregó correctamente.',
                              trText: 'Kartvizit başarıyla eklendi.',
                            ),
                            const Color(0xFF46A44D),
                          );
                        } else {
                          context.safePop();
                          await actions.customSnackbar(
                            context,
                            FFLocalizations.of(context).getVariableText(
                              enText: 'Business card not added.',
                              arText: 'لم تتم إضافة بطاقة العمل.',
                              zh_HansText: '未添加名片。',
                              frText: 'Carte de visite non ajoutée.',
                              deText: 'Visitenkarte nicht hinzugefügt.',
                              ptText: 'Cartão de visita não adicionado.',
                              ruText: 'Визитка не добавлена.',
                              esText: 'Tarjeta de presentación no agregada.',
                              trText: 'Kartvizit eklenmedi.',
                            ),
                            FlutterFlowTheme.of(context).error,
                          );
                        }

                        FFAppState().update(() {
                          FFAppState().scannedURL = '';
                          FFAppState().SelectedGroupId = 0;
                          FFAppState().selectedGroupIndex = 1000;
                        });
                      } else {
                        context.safePop();
                        await actions.customSnackbar(
                          context,
                          FFLocalizations.of(context).getVariableText(
                            enText: 'Business card already added.',
                            arText: 'لم تتم إضافة بطاقة العمل.',
                            zh_HansText: '未添加名片。',
                            frText: 'Carte de visite non ajoutée.',
                            deText: 'Visitenkarte nicht hinzugefügt.',
                            ptText: 'Cartão de visita não adicionado.',
                            ruText: 'Визитка не добавлена.',
                            esText: 'Tarjeta de presentación no agregada.',
                            trText: 'Kartvizit eklenmedi.',
                          ),
                          FlutterFlowTheme.of(context).error,
                        );
                      }
                    } else {
                      await actions.customSnackbar(
                        context,
                        FFLocalizations.of(context).getVariableText(
                          enText: 'Please Select Business Group.',
                          arText: 'الرجاء تحديد مجموعة الأعمال.',
                          zh_HansText: '请选择业务组。',
                          frText:
                              'Veuillez sélectionner un groupe d\'entreprises.',
                          deText: 'Bitte wählen Sie Unternehmensgruppe aus.',
                          ptText: 'Selecione o grupo empresarial.',
                          ruText: 'Пожалуйста, выберите Бизнес-группу.',
                          esText: 'Por favor seleccione grupo empresarial.',
                          trText: 'Lütfen İşletme Grubunu Seçiniz.',
                        ),
                        FlutterFlowTheme.of(context).error,
                      );
                    }

                    setState(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    'nl3mfnja' /* Save */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 45.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        24.0, 0.0, 24.0, 0.0),
                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFFE4BB31),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Nunito Sans',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Nunito Sans'),
                        ),
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
    );
  }
}
