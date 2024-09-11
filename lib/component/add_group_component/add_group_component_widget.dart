import '/backend/api_requests/api_calls.dart';
import '/component/select_group_dialog_box/select_group_dialog_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_group_component_model.dart';
export 'add_group_component_model.dart';

class AddGroupComponentWidget extends StatefulWidget {
  const AddGroupComponentWidget({
    super.key,
    this.data,
  });

  final List<dynamic>? data;

  @override
  State<AddGroupComponentWidget> createState() =>
      _AddGroupComponentWidgetState();
}

class _AddGroupComponentWidgetState extends State<AddGroupComponentWidget> {
  late AddGroupComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddGroupComponentModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        height: 200.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'avdfo1ha' /* Add Group */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nunito Sans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts:
                          GoogleFonts.asMap().containsKey('Nunito Sans'),
                    ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .override(
                          fontFamily: 'Nunito Sans',
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Nunito Sans'),
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'qyw7qjzy' /* Group Name */,
                    ),
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.safePop();
                        },
                        text: FFLocalizations.of(context).getText(
                          'xw06my7r' /* Cancel */,
                        ),
                        options: FFButtonOptions(
                          width: 175.0,
                          height: 45.0,
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
                    Expanded(
                      child: Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            if (functions.isGroupNameValid(
                                    widget.data!.toList(),
                                    _model.textController.text) ==
                                true) {
                              if (FFAppState().role == 'Super Admin') {
                                _model.apiResult16n =
                                    await VcardGroup.groupCreateCall.call(
                                  authToken: FFAppState().authToken,
                                  name: _model.textController.text,
                                );
                                if ((_model.apiResult16n?.succeeded ?? true)) {
                                  Navigator.pop(context);
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child:
                                            const SelectGroupDialogBoxWidget(),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                } else {
                                  context.safePop();
                                  await actions.customSnackbar(
                                    context,
                                    FFLocalizations.of(context).getVariableText(
                                      enText: 'Please enter valid Group name.',
                                      arText: 'الرجاء إدخال اسم المجموعة صالح.',
                                      zh_HansText: '请输入有效的组名称。',
                                      frText:
                                          'Veuillez saisir un nom de groupe valide.',
                                      deText:
                                          'Bitte geben Sie einen gültigen Gruppennamen ein.',
                                      ptText: 'Insira um nome de grupo válido.',
                                      ruText:
                                          'Пожалуйста, введите правильное название группы.',
                                      esText:
                                          'Por favor ingrese un nombre de grupo válido.',
                                      trText: 'Lütfen geçerli Grup adı girin.',
                                    ),
                                    FlutterFlowTheme.of(context).error,
                                  );
                                }
                              } else {
                                _model.adminGroupRes =
                                    await VcardGroup.adminGroupCreateCall.call(
                                  authToken: FFAppState().authToken,
                                  name: _model.textController.text,
                                );
                                if ((_model.adminGroupRes?.succeeded ?? true)) {
                                  Navigator.pop(context);
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child:
                                            const SelectGroupDialogBoxWidget(),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                } else {
                                  context.safePop();
                                  await actions.customSnackbar(
                                    context,
                                    FFLocalizations.of(context).getVariableText(
                                      enText: 'Please enter valid Group name.',
                                      arText: 'الرجاء إدخال اسم المجموعة صالح.',
                                      zh_HansText: '请输入有效的组名称。',
                                      frText:
                                          'Veuillez saisir un nom de groupe valide.',
                                      deText:
                                          'Bitte geben Sie einen gültigen Gruppennamen ein.',
                                      ptText: 'Insira um nome de grupo válido.',
                                      ruText:
                                          'Пожалуйста, введите правильное название группы.',
                                      esText:
                                          'Por favor ingrese un nombre de grupo válido.',
                                      trText: 'Lütfen geçerli Grup adı girin.',
                                    ),
                                    FlutterFlowTheme.of(context).error,
                                  );
                                }
                              }
                            } else {
                              context.safePop();
                              await actions.customSnackbar(
                                context,
                                FFLocalizations.of(context).getVariableText(
                                  enText: 'Group name is already added.',
                                  arText: 'تمت إضافة اسم المجموعة بالفعل.',
                                  zh_HansText: '群组名称已添加.',
                                  frText: 'Le nom du groupe est déjà ajouté.',
                                  deText:
                                      'Der Gruppenname wurde bereits hinzugefügt.',
                                  ptText: ' O nome do grupo já foi adicionado.',
                                  ruText: 'Название группы уже добавлено.',
                                  esText:
                                      'El nombre del grupo ya está agregado.',
                                  trText: 'Grup adı zaten eklenmiş.',
                                ),
                                FlutterFlowTheme.of(context).error,
                              );
                            }

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'pdjihobs' /* Save */,
                          ),
                          options: FFButtonOptions(
                            width: 175.0,
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
