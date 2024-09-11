import '/backend/api_requests/api_calls.dart';
import '/component/empty_data_component/empty_data_component_widget.dart';
import '/component/select_group_dialog_box/select_group_dialog_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'delete_group_dialog_box_model.dart';
export 'delete_group_dialog_box_model.dart';

class DeleteGroupDialogBoxWidget extends StatefulWidget {
  const DeleteGroupDialogBoxWidget({super.key});

  @override
  State<DeleteGroupDialogBoxWidget> createState() =>
      _DeleteGroupDialogBoxWidgetState();
}

class _DeleteGroupDialogBoxWidgetState
    extends State<DeleteGroupDialogBoxWidget> {
  late DeleteGroupDialogBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteGroupDialogBoxModel());
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
              Text(
                FFLocalizations.of(context).getText(
                  'ya1mvu3y' /* Remove Group */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nunito Sans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts:
                          GoogleFonts.asMap().containsKey('Nunito Sans'),
                    ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
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
                                final listViewGroupsResponse = snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final data = VcardGroup.groupsCall
                                            .data(
                                              listViewGroupsResponse.jsonBody,
                                            )
                                            ?.toList() ??
                                        [];
                                    if (data.isEmpty) {
                                      return const SizedBox(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: EmptyDataComponentWidget(),
                                      );
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
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              FFAppState().selectedGroupIndex =
                                                  dataIndex;
                                              FFAppState().SelectedGroupId =
                                                  getJsonField(
                                                dataItem,
                                                r'''$.id''',
                                              );
                                            });
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
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
                                                              fontSize: 16.0,
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
                                                          shape:
                                                              BoxShape.circle,
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
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                );
                              },
                            );
                          } else {
                            return FutureBuilder<ApiCallResponse>(
                              future: VcardGroup.adminGroupCall.call(
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
                                final listViewAdminGroupResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final data = VcardGroup.adminGroupCall
                                            .data(
                                              listViewAdminGroupResponse
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
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              FFAppState().selectedGroupIndex =
                                                  dataIndex;
                                              FFAppState().SelectedGroupId =
                                                  getJsonField(
                                                dataItem,
                                                r'''$.id''',
                                              );
                                            });
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
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
                                                              fontSize: 16.0,
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
                                                          shape:
                                                              BoxShape.circle,
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
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
              Builder(
                builder: (context) => Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.apiResulths7 =
                          await VcardGroup.deleteGroupCall.call(
                        authToken: FFAppState().authToken,
                        id: FFAppState().SelectedGroupId,
                      );
                      if ((_model.apiResulths7?.succeeded ?? true)) {
                        FFAppState().update(() {
                          FFAppState().selectedBusinessGroupIndex = 0;
                        });
                        if (FFAppState().isBusinessScreenSelected) {
                          if (FFAppState().role == 'Super Admin') {
                            _model.updatePage(() {
                              FFAppState().isAPILoading = true;
                            });
                            _model.groupRes1 = await VcardGroup.groupsCall.call(
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
                              FFAppState().selectedGroupIndex = 1000;
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
                              FFAppState().businessGroupList =
                                  VcardGroup.adminGroupCall
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
                              FFAppState().selectedGroupIndex = 1000;
                            });
                          }
                        }
                        context.safePop();
                        FFAppState().update(() {
                          FFAppState().isBusinessScreenSelected = true;
                        });
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: const SelectGroupDialogBoxWidget(),
                            );
                          },
                        ).then((value) => setState(() {}));
                      } else {
                        context.safePop();
                        await actions.customSnackbar(
                          context,
                          FFLocalizations.of(context).getVariableText(
                            enText: 'Business card not Deleted.',
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

                      FFAppState().update(() {});

                      setState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      '6bpycp98' /* Remove Group */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 45.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 0.0, 24.0, 0.0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFFE4BB31),
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
