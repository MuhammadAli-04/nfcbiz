import '/backend/api_requests/api_calls.dart';
import '/component/delete_dialog_box/delete_dialog_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appointment_sheet_model.dart';
export 'appointment_sheet_model.dart';

class AppointmentSheetWidget extends StatefulWidget {
  const AppointmentSheetWidget({
    super.key,
    required this.id,
    required this.status,
  });

  final int? id;
  final int? status;

  @override
  State<AppointmentSheetWidget> createState() => _AppointmentSheetWidgetState();
}

class _AppointmentSheetWidgetState extends State<AppointmentSheetWidget> {
  late AppointmentSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppointmentSheetModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(
          0.0,
          valueOrDefault<double>(
            widget.status == 1 ? 60.0 : 0.0,
            0.0,
          ),
          0.0,
          0.0),
      child: Container(
        width: double.infinity,
        height: 430.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FutureBuilder<ApiCallResponse>(
            future: VcardGroup.singleAppointmentCall.call(
              id: widget.id,
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
              final listViewSingleAppointmentResponse = snapshot.data!;
              return ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 15.0),
                      child: Container(
                        width: 80.0,
                        height: 3.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE0E3E7),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 5.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            VcardGroup.singleAppointmentCall.vcardName(
                              listViewSingleAppointmentResponse.jsonBody,
                            ),
                            'name',
                          ).maybeHandleOverflow(
                            maxChars: 20,
                            replacement: '…',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                        ),
                        Container(
                          width: 70.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            color: VcardGroup.singleAppointmentCall.paidamount(
                                      listViewSingleAppointmentResponse
                                          .jsonBody,
                                    ) ==
                                    ''
                                ? const Color(0xFFE4BB31)
                                : const Color(0xFFFF9900),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            VcardGroup.singleAppointmentCall.paidamount(
                                      listViewSingleAppointmentResponse
                                          .jsonBody,
                                    ) ==
                                    ''
                                ? 'Free'
                                : 'Paid',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Nunito Sans'),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 5.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                          color: Color(0xFF79818A),
                          size: 24.0,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Text(
                            functions.formatDate(valueOrDefault<String>(
                              VcardGroup.singleAppointmentCall.date(
                                listViewSingleAppointmentResponse.jsonBody,
                              ),
                              'date',
                            )),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: const Color(0xFF79818A),
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Nunito Sans'),
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '466tlio2' /* • */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: const Color(0xFF79818A),
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Nunito Sans'),
                                ),
                          ),
                        ),
                        Text(
                          functions.getAppointmentFormatedTime(
                              VcardGroup.singleAppointmentCall.from(
                                listViewSingleAppointmentResponse.jsonBody,
                              )!,
                              VcardGroup.singleAppointmentCall.to(
                                listViewSingleAppointmentResponse.jsonBody,
                              )!),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    color: const Color(0xFF79818A),
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 20.0, 0.0, 0.0),
                      child: Container(
                        width: 100.0,
                        height: 35.0,
                        constraints: const BoxConstraints(
                          maxWidth: 100.0,
                        ),
                        decoration: BoxDecoration(
                          color: VcardGroup.singleAppointmentCall.status(
                                    listViewSingleAppointmentResponse.jsonBody,
                                  ) ==
                                  0
                              ? const Color(0x19FF9900)
                              : const Color(0x1A00B96D),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          VcardGroup.singleAppointmentCall.status(
                                    listViewSingleAppointmentResponse.jsonBody,
                                  ) ==
                                  0
                              ? 'Pending'
                              : 'Completed',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Nunito Sans',
                                color: VcardGroup.singleAppointmentCall.status(
                                          listViewSingleAppointmentResponse
                                              .jsonBody,
                                        ) ==
                                        0
                                    ? const Color(0xFFFF9900)
                                    : const Color(0xFF00B96D),
                                fontSize: 15.0,
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
                        5.0, 20.0, 0.0, 10.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        height: 110.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 0.0,
                              color: Color(0xFFE4BB31),
                              offset: Offset(-5.0, 0.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 8.0, 0.0, 8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  VcardGroup.singleAppointmentCall.name(
                                    listViewSingleAppointmentResponse.jsonBody,
                                  ),
                                  'name',
                                ).maybeHandleOverflow(
                                  maxChars: 30,
                                  replacement: '…',
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Icon(
                                    Icons.mail_rounded,
                                    color: Color(0xFFE4BB31),
                                    size: 20.0,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        VcardGroup.singleAppointmentCall.email(
                                          listViewSingleAppointmentResponse
                                              .jsonBody,
                                        ),
                                        'email',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: const Color(0xFF79818A),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Nunito Sans'),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Icon(
                                    Icons.call,
                                    color: Color(0xFFE4BB31),
                                    size: 20.0,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        VcardGroup.singleAppointmentCall.phone(
                                          listViewSingleAppointmentResponse
                                              .jsonBody,
                                        ),
                                        'phone',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: const Color(0xFF79818A),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Nunito Sans'),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (VcardGroup.singleAppointmentCall.status(
                        listViewSingleAppointmentResponse.jsonBody,
                      ) ==
                      0)
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 15.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.apiResultnvg =
                              await VcardGroup.appointmentCompletedCall.call(
                            authToken: FFAppState().authToken,
                            id: widget.id,
                            status: 1,
                          );
                          if ((_model.apiResultnvg?.succeeded ?? true)) {
                            context.safePop();
                            FFAppState().update(() {});
                            await actions.customSnackbar(
                              context,
                              FFLocalizations.of(context).getVariableText(
                                enText: 'Apponintment Mark As Completed.',
                                arText: 'علامة التعيين كمكتمل.',
                                zh_HansText: '约会标记为已完成。',
                                frText: 'Marquer le rendez-vous comme terminé.',
                                deText: 'Termin als abgeschlossen markieren.',
                                ptText:
                                    'Marcação de compromisso como concluída.',
                                ruText: 'Назначение пометить как завершенное.',
                                esText: 'Marcar la cita como completada.',
                                trText:
                                    ' Randevu Tamamlandı Olarak İşaretleyin.',
                              ),
                              const Color(0xFF46A44D),
                            );
                          }

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'xtmrhsl8' /* Mark as Completed */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 45.0,
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
                  Builder(
                    builder: (context) => Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 10.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
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
                                child: DeleteDialogBoxWidget(
                                  titile: FFLocalizations.of(context).getText(
                                    'gddc3pb8' /* Delete Appointment */,
                                  ),
                                  subtitle: FFLocalizations.of(context).getText(
                                    '8ozw55kd' /* Are you sure want to delete th... */,
                                  ),
                                  deleteId: widget.id!,
                                  deleteType: 'Appointment',
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        text: FFLocalizations.of(context).getText(
                          'yjdr134k' /* Delete Appointment */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 45.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0x27F35050),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Nunito Sans',
                                    color: const Color(0xFFF35050),
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
