import '/backend/api_requests/api_calls.dart';
import '/component/appointment_sheet/appointment_sheet_widget.dart';
import '/component/drawer/drawer_widget.dart';
import '/component/empty_data_component/empty_data_component_widget.dart';
import '/component/scan_component/scan_component_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().role == 'Admin') {
        _model.apiResultkj4 = await VcardGroup.paymentRequestStatusCall.call(
          authToken: FFAppState().authToken,
        );
        if (VcardGroup.paymentRequestStatusCall.status(
              (_model.apiResultkj4?.jsonBody ?? ''),
            ) ==
            'Approved') {
          _model.apiResultfev = await VcardGroup.subscriptionPlanCall.call(
            authToken: FFAppState().authToken,
          );
          if (!functions.isSubscriptionExpire(VcardGroup.subscriptionPlanCall
              .data(
                (_model.apiResultfev?.jsonBody ?? ''),
              )!
              .toList())) {
            context.goNamed(
              'plans_screen',
              extra: <String, dynamic>{
                kTransitionInfoKey: const TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 300),
                ),
              },
            );
          }
        } else {
          context.pushNamed('paymemt_request_Screen');
        }
      }
    });
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
        backgroundColor: FlutterFlowTheme.of(context).primary,
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
              'nr07wewc' /* Dashboard */,
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
          actions: [
            wrapWithModel(
              model: _model.scanComponentModel,
              updateCallback: () => setState(() {}),
              child: const ScanComponentWidget(),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Builder(
          builder: (context) {
            if (FFAppState().role == 'Super Admin') {
              return Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: FutureBuilder<ApiCallResponse>(
                  future: VcardGroup.superDashboardCall.call(
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
                    final listViewSuperDashboardResponse = snapshot.data!;
                    return ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              5.0, 0.0, 6.0, 0.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          alignment: const AlignmentDirectional(
                                              1.0, -1.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(15.0, 0.0, 0.0, 15.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      getJsonField(
                                                        listViewSuperDashboardResponse
                                                            .jsonBody,
                                                        r'''$.data.activeUsersCount''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: const Color(
                                                                0xFFE4BB31),
                                                            fontSize: 26.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            useGoogleFonts:
                                                                GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Nunito Sans'),
                                                          ),
                                                    ),
                                                    Container(
                                                      width: 60.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0x1AE4BB31),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            FFAppState().selectLanguageIndex ==
                                                                    0
                                                                ? 0.0
                                                                : 300.0,
                                                            0.0,
                                                          )),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            FFAppState().selectLanguageIndex ==
                                                                    0
                                                                ? 300.0
                                                                : 0.0,
                                                            0.0,
                                                          )),
                                                          topLeft:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            FFAppState().selectLanguageIndex ==
                                                                    0
                                                                ? 50.0
                                                                : 0.0,
                                                            0.0,
                                                          )),
                                                          topRight:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            FFAppState().selectLanguageIndex ==
                                                                    0
                                                                ? 0.0
                                                                : 50.0,
                                                            0.0,
                                                          )),
                                                        ),
                                                      ),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(15.0,
                                                                0.0, 0.0, 10.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/user-solid_1.png',
                                                            width: 30.0,
                                                            height: 20.0,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 8.0, 5.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '6hsy28xo' /* Total Active 
Users */
                                                      ,
                                                    ),
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: const Color(
                                                              0xFF1E2935),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts:
                                                              GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Nunito Sans'),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              6.0, 0.0, 5.0, 0.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          alignment: const AlignmentDirectional(
                                              1.0, -1.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(15.0, 0.0, 0.0, 15.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      getJsonField(
                                                        listViewSuperDashboardResponse
                                                            .jsonBody,
                                                        r'''$.data.deActiveUsersCount''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: const Color(
                                                                0xFFF35050),
                                                            fontSize: 26.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            useGoogleFonts:
                                                                GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Nunito Sans'),
                                                          ),
                                                    ),
                                                    Container(
                                                      width: 60.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0x1AF35050),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            FFAppState().selectLanguageIndex ==
                                                                    0
                                                                ? 0.0
                                                                : 300.0,
                                                            0.0,
                                                          )),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            FFAppState().selectLanguageIndex ==
                                                                    0
                                                                ? 300.0
                                                                : 0.0,
                                                            0.0,
                                                          )),
                                                          topLeft:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            FFAppState().selectLanguageIndex ==
                                                                    0
                                                                ? 50.0
                                                                : 0.0,
                                                            0.0,
                                                          )),
                                                          topRight:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            FFAppState().selectLanguageIndex ==
                                                                    0
                                                                ? 0.0
                                                                : 50.0,
                                                            0.0,
                                                          )),
                                                        ),
                                                      ),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(15.0,
                                                                0.0, 0.0, 10.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/deactivate.png',
                                                            width: 30.0,
                                                            height: 20.0,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 8.0, 5.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'eck7f7xr' /* Total Deactivated
Users */
                                                      ,
                                                    ),
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: const Color(
                                                              0xFF1E2935),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts:
                                                              GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Nunito Sans'),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
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
                                  Flexible(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              5.0, 0.0, 6.0, 0.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          alignment: const AlignmentDirectional(
                                              1.0, -1.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(15.0, 0.0, 0.0, 15.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      getJsonField(
                                                        listViewSuperDashboardResponse
                                                            .jsonBody,
                                                        r'''$.data.activeVcard''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: const Color(
                                                                0xFFE4BB31),
                                                            fontSize: 26.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            useGoogleFonts:
                                                                GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Nunito Sans'),
                                                          ),
                                                    ),
                                                    Container(
                                                      width: 60.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0x1A00B96D),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            FFAppState().selectLanguageIndex ==
                                                                    0
                                                                ? 0.0
                                                                : 300.0,
                                                            0.0,
                                                          )),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            FFAppState().selectLanguageIndex ==
                                                                    0
                                                                ? 300.0
                                                                : 0.0,
                                                            0.0,
                                                          )),
                                                          topLeft:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            FFAppState().selectLanguageIndex ==
                                                                    0
                                                                ? 50.0
                                                                : 0.0,
                                                            0.0,
                                                          )),
                                                          topRight:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            FFAppState().selectLanguageIndex ==
                                                                    0
                                                                ? 0.0
                                                                : 50.0,
                                                            0.0,
                                                          )),
                                                        ),
                                                      ),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(15.0,
                                                                0.0, 0.0, 10.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/Active.png',
                                                            width: 30.0,
                                                            height: 20.0,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 8.0, 5.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'rxccenn6' /* Total Active
Vcards */
                                                      ,
                                                    ),
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: const Color(
                                                              0xFF1E2935),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts:
                                                              GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Nunito Sans'),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              6.0, 0.0, 5.0, 0.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          alignment: const AlignmentDirectional(
                                              1.0, -1.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(15.0, 0.0, 0.0, 15.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      getJsonField(
                                                        listViewSuperDashboardResponse
                                                            .jsonBody,
                                                        r'''$.data.deActiveVcard''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: const Color(
                                                                0xFFFF9900),
                                                            //deactive card 0
                                                            fontSize: 26.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            useGoogleFonts:
                                                                GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Nunito Sans'),
                                                          ),
                                                    ),
                                                    Container(
                                                      width: 60.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0x1AFF9900),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            FFAppState().selectLanguageIndex ==
                                                                    0
                                                                ? 0.0
                                                                : 300.0,
                                                            0.0,
                                                          )),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            FFAppState().selectLanguageIndex ==
                                                                    0
                                                                ? 300.0
                                                                : 0.0,
                                                            0.0,
                                                          )),
                                                          topLeft:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            FFAppState().selectLanguageIndex ==
                                                                    0
                                                                ? 50.0
                                                                : 0.0,
                                                            0.0,
                                                          )),
                                                          topRight:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            FFAppState().selectLanguageIndex ==
                                                                    0
                                                                ? 0.0
                                                                : 50.0,
                                                            0.0,
                                                          )),
                                                        ),
                                                      ),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(15.0,
                                                                0.0, 0.0, 10.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/Deactive.png',
                                                            width: 30.0,
                                                            height: 20.0,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 8.0, 5.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'u6g2qwc5' /* Total Deactivated
Vcards */
                                                      ,
                                                    ),
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: const Color(
                                                              0xFF1E2935),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts:
                                                              GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Nunito Sans'),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 10.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ufd1g8fs' /* VCard Analytics */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Nunito Sans'),
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 5.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 240.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: FutureBuilder<ApiCallResponse>(
                              future: VcardGroup.superAdminIncomeChartCall.call(
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
                                final containerSuperAdminIncomeChartResponse =
                                    snapshot.data!;
                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 15.0, 5.0),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: FlutterFlowLineChart(
                                        data: [
                                          FFLineChartData(
                                            xData:
                                                functions.generateMonthList(),
                                            yData: functions.generateChartList(
                                                (getJsonField(
                                              containerSuperAdminIncomeChartResponse
                                                  .jsonBody,
                                              r'''$.data.breakDown[0].data[*]''',
                                              true,
                                            ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()),
                                            settings: LineChartBarData(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              barWidth: 5.0,
                                              isCurved: true,
                                              preventCurveOverShooting: true,
                                              belowBarData: BarAreaData(
                                                show: true,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                              ),
                                            ),
                                          )
                                        ],
                                        chartStylingInfo: ChartStylingInfo(
                                          enableTooltip: true,
                                          tooltipBackgroundColor: Colors.white,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          borderWidth: 1.0,
                                        ),
                                        axisBounds: const AxisBounds(
                                          minX: 1.0,
                                          maxX: 12.0,
                                        ),
                                        xAxisLabelInfo: AxisLabelInfo(
                                          title: FFLocalizations.of(context)
                                              .getText(
                                            'f1noyzo0' /* Month */,
                                          ),
                                          titleTextStyle: GoogleFonts.getFont(
                                            'Nunito Sans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                          showLabels: true,
                                          labelInterval: 1.0,
                                          labelFormatter: LabelFormatter(
                                            numberFormat: (val) => formatNumber(
                                              val,
                                              formatType: FormatType.custom,
                                              format: '',
                                              locale: '',
                                            ),
                                          ),
                                        ),
                                        yAxisLabelInfo: AxisLabelInfo(
                                          title: FFLocalizations.of(context)
                                              .getText(
                                            'lmysjehc' /* Income */,
                                          ),
                                          titleTextStyle: GoogleFonts.getFont(
                                            'Nunito Sans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            } else {
              return FutureBuilder<ApiCallResponse>(
                future: VcardGroup.todayAppointmentCall.call(
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
                  final containerTodayAppointmentResponse = snapshot.data!;
                  return Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          15.0, 0.0, 15.0, 0.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: VcardGroup.adminDashboardCall.call(
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          final listViewAdminDashboardResponse = snapshot.data!;
                          return ListView(
                            padding: EdgeInsets.zero,
                            primary: false,
                            scrollDirection: Axis.vertical,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(5.0, 0.0, 6.0, 0.0),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                alignment:
                                                    const AlignmentDirectional(
                                                        1.0, -1.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          15.0, 0.0, 0.0, 15.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              listViewAdminDashboardResponse
                                                                  .jsonBody,
                                                              r'''$.data.activeVcard''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: const Color(
                                                                      0xFFE4BB31),
                                                                  fontSize:
                                                                      26.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Nunito Sans'),
                                                                ),
                                                          ),
                                                          Container(
                                                            width: 60.0,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0x1AE4BB31),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFAppState().selectLanguageIndex ==
                                                                          0
                                                                      ? 0.0
                                                                      : 300.0,
                                                                  0.0,
                                                                )),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFAppState().selectLanguageIndex ==
                                                                          0
                                                                      ? 300.0
                                                                      : 0.0,
                                                                  0.0,
                                                                )),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFAppState().selectLanguageIndex ==
                                                                          0
                                                                      ? 50.0
                                                                      : 0.0,
                                                                  0.0,
                                                                )),
                                                                topRight: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFAppState().selectLanguageIndex ==
                                                                          0
                                                                      ? 0.0
                                                                      : 50.0,
                                                                  0.0,
                                                                )),
                                                              ),
                                                            ),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      15.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/user-solid_1.png',
                                                                  width: 30.0,
                                                                  height: 20.0,
                                                                  fit: BoxFit
                                                                      .fitHeight,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                8.0, 5.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'w4yi1rza' /* Total Active
Vcards */
                                                            ,
                                                          ),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: const Color(
                                                                    0xFF1E2935),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Nunito Sans'),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(6.0, 0.0, 5.0, 0.0),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                alignment:
                                                    const AlignmentDirectional(
                                                        1.0, -1.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          15.0, 0.0, 0.0, 15.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              listViewAdminDashboardResponse
                                                                  .jsonBody,
                                                              r'''$.data.deActiveVcard''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: const Color(
                                                                      0xFFE4BB31),
                                                                  fontSize:
                                                                      26.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Nunito Sans'),
                                                                ),
                                                          ),
                                                          Container(
                                                            width: 60.0,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0x1AE4BB31),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFAppState().selectLanguageIndex ==
                                                                          0
                                                                      ? 0.0
                                                                      : 300.0,
                                                                  0.0,
                                                                )),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFAppState().selectLanguageIndex ==
                                                                          0
                                                                      ? 300.0
                                                                      : 0.0,
                                                                  0.0,
                                                                )),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFAppState().selectLanguageIndex ==
                                                                          0
                                                                      ? 50.0
                                                                      : 0.0,
                                                                  0.0,
                                                                )),
                                                                topRight: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFAppState().selectLanguageIndex ==
                                                                          0
                                                                      ? 0.0
                                                                      : 50.0,
                                                                  0.0,
                                                                )),
                                                              ),
                                                            ),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      15.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/deactivate.png',
                                                                  width: 30.0,
                                                                  height: 20.0,
                                                                  fit: BoxFit
                                                                      .fitHeight,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                8.0, 5.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'dx7jboeu' /* Total Deactivated
Vcards */
                                                            ,
                                                          ),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: const Color(
                                                                    0xFF1E2935),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Nunito Sans'),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(5.0, 0.0, 6.0, 0.0),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                alignment:
                                                    const AlignmentDirectional(
                                                        1.0, -1.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          15.0, 0.0, 0.0, 15.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              listViewAdminDashboardResponse
                                                                  .jsonBody,
                                                              r'''$.data.enquiry''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: const Color(
                                                                      0xFFE4BB31),
                                                                  fontSize:
                                                                      26.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Nunito Sans'),
                                                                ),
                                                          ),
                                                          Container(
                                                            width: 60.0,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0x1AE4BB31),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFAppState().selectLanguageIndex ==
                                                                          0
                                                                      ? 0.0
                                                                      : 300.0,
                                                                  0.0,
                                                                )),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFAppState().selectLanguageIndex ==
                                                                          0
                                                                      ? 300.0
                                                                      : 0.0,
                                                                  0.0,
                                                                )),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFAppState().selectLanguageIndex ==
                                                                          0
                                                                      ? 50.0
                                                                      : 0.0,
                                                                  0.0,
                                                                )),
                                                                topRight: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFAppState().selectLanguageIndex ==
                                                                          0
                                                                      ? 0.0
                                                                      : 50.0,
                                                                  0.0,
                                                                )),
                                                              ),
                                                            ),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      15.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/enquire.png',
                                                                  width: 30.0,
                                                                  height: 20.0,
                                                                  fit: BoxFit
                                                                      .fitHeight,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                8.0, 5.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '76c7kx4k' /* Today 
Enquiries */
                                                            ,
                                                          ),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: const Color(
                                                                    0xFF1E2935),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Nunito Sans'),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(6.0, 0.0, 5.0, 0.0),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                alignment:
                                                    const AlignmentDirectional(
                                                        1.0, -1.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          15.0, 0.0, 0.0, 15.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              listViewAdminDashboardResponse
                                                                  .jsonBody,
                                                              r'''$.data.appointment''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: const Color(
                                                                      0xFFE4BB31),
                                                                  fontSize:
                                                                      26.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Nunito Sans'),
                                                                ),
                                                          ),
                                                          Container(
                                                            width: 60.0,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0x19E4BB31),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFAppState().selectLanguageIndex ==
                                                                          0
                                                                      ? 0.0
                                                                      : 300.0,
                                                                  0.0,
                                                                )),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFAppState().selectLanguageIndex ==
                                                                          0
                                                                      ? 300.0
                                                                      : 0.0,
                                                                  0.0,
                                                                )),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFAppState().selectLanguageIndex ==
                                                                          0
                                                                      ? 50.0
                                                                      : 0.0,
                                                                  0.0,
                                                                )),
                                                                topRight: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFAppState().selectLanguageIndex ==
                                                                          0
                                                                      ? 0.0
                                                                      : 50.0,
                                                                  0.0,
                                                                )),
                                                              ),
                                                            ),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      15.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/appointment.png',
                                                                  width: 30.0,
                                                                  height: 20.0,
                                                                  fit: BoxFit
                                                                      .fitHeight,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                8.0, 5.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'zvfj14as' /* Today 
Appointments */
                                                            ,
                                                          ),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: const Color(
                                                                    0xFF1E2935),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Nunito Sans'),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 10.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'xdgkk7kf' /* VCard Analytics */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Nunito Sans'),
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 240.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future:
                                        VcardGroup.adminIncomeChartCall.call(
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      final containerAdminIncomeChartResponse =
                                          snapshot.data!;
                                      return Container(
                                        decoration: const BoxDecoration(),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: custom_widgets.LineChartWidget(
                                            width: double.infinity,
                                            height: double.infinity,
                                            weeklyLabels: VcardGroup
                                                .adminIncomeChartCall
                                                .weeklyLabel(
                                              containerAdminIncomeChartResponse
                                                  .jsonBody,
                                            )!,
                                            chartData: VcardGroup
                                                .adminIncomeChartCall
                                                .data(
                                              containerAdminIncomeChartResponse
                                                  .jsonBody,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '721dm1ol' /* Today’s Appointments */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            fontSize: 18.0,
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
                                        context.pushNamed('appointment_screen');

                                        setState(() {
                                          FFAppState().selectedDrawerPage =
                                              'Appointments';
                                          FFAppState().isVcardAppointment =
                                              false;
                                        });
                                      },
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'ryoxyyzt' /* View All */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color: const Color(0xFFE4BB31),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          'Nunito Sans'),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final data = getJsonField(
                                      containerTodayAppointmentResponse
                                          .jsonBody,
                                      r'''$.data''',
                                    ).toList();
                                    if (data.isEmpty) {
                                      return const SizedBox(
                                        width: double.infinity,
                                        child: EmptyDataComponentWidget(),
                                      );
                                    }
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(data.length,
                                            (dataIndex) {
                                          final dataItem = data[dataIndex];
                                          return Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(3.0, 0.0, 3.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                if (FFAppState()
                                                        .selectLanguageIndex ==
                                                    0) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 0.0,
                                                            5.0, 10.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child: SizedBox(
                                                                  height: 430.0,
                                                                  child:
                                                                      AppointmentSheetWidget(
                                                                    id: getJsonField(
                                                                      dataItem,
                                                                      r'''$.id''',
                                                                    ),
                                                                    status:
                                                                        getJsonField(
                                                                      dataItem,
                                                                      r'''$.status''',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 120.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                blurRadius: 0.0,
                                                                color: Color(
                                                                    0xFFE4BB31),
                                                                offset: Offset(
                                                                  -5.0,
                                                                  0.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    15.0,
                                                                    0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            55.0,
                                                                        height:
                                                                            35.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: functions.getAppointmentPaidInfo(getJsonField(
                                                                            dataItem,
                                                                            r'''$.paid_amount''',
                                                                          ))
                                                                              ? const Color(0xFFE4BB31)
                                                                              : const Color(0xFFFF9900),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(15.0),
                                                                            bottomRight:
                                                                                Radius.circular(0.0),
                                                                            topLeft:
                                                                                Radius.circular(0.0),
                                                                            topRight:
                                                                                Radius.circular(10.0),
                                                                          ),
                                                                        ),
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          functions.getAppointmentPaidInfo(getJsonField(
                                                                            dataItem,
                                                                            r'''$.paid_amount''',
                                                                          ))
                                                                              ? 'Free'
                                                                              : 'Paid',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                color: Colors.white,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      getJsonField(
                                                                        dataItem,
                                                                        r'''$.vcard_name''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              functions.getAppointmentStatusInfo(getJsonField(
                                                                            dataItem,
                                                                            r'''$.status''',
                                                                          )),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                color: functions.getAppointmentStatusInfo(getJsonField(
                                                                                          dataItem,
                                                                                          r'''$.status''',
                                                                                        )) ==
                                                                                        'Pending'
                                                                                    ? const Color(0xFFFF9900)
                                                                                    : const Color(0xFF00B96D),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'm929v9xi' /*   |   */,
                                                                          ),
                                                                          style:
                                                                              const TextStyle(
                                                                            color:
                                                                                Color(0xFF79818A),
                                                                          ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            dataItem,
                                                                            r'''$.name''',
                                                                          ).toString(),
                                                                          style:
                                                                              GoogleFonts.getFont(
                                                                            'Nunito Sans',
                                                                            color:
                                                                                const Color(0xFF79818A),
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        35.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFF6F8F9),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Text(
                                                                            functions.getAppointmentFormatedTime(
                                                                                getJsonField(
                                                                                  dataItem,
                                                                                  r'''$.from_time''',
                                                                                ).toString(),
                                                                                getJsonField(
                                                                                  dataItem,
                                                                                  r'''$.to_time''',
                                                                                ).toString()),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Nunito Sans',
                                                                                  color: const Color(0xFF79818A),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'tkru2ovh' /* • */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    color: const Color(0xFF79818A),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            getJsonField(
                                                                              dataItem,
                                                                              r'''$.date''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Nunito Sans',
                                                                                  color: const Color(0xFF79818A),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                ),
                                                                          ),
                                                                          const Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.watch_later_outlined,
                                                                              color: Color(0xFFE4BB31),
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
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
                                                } else {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                            0.0, 10.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child: SizedBox(
                                                                  height: 430.0,
                                                                  child:
                                                                      AppointmentSheetWidget(
                                                                    id: getJsonField(
                                                                      dataItem,
                                                                      r'''$.id''',
                                                                    ),
                                                                    status:
                                                                        getJsonField(
                                                                      dataItem,
                                                                      r'''$.status''',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 120.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                blurRadius: 0.0,
                                                                color: Color(
                                                                    0xFFE4BB31),
                                                                offset: Offset(
                                                                  -5.0,
                                                                  0.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Text(
                                                                      getJsonField(
                                                                        dataItem,
                                                                        r'''$.vcard_name''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Nunito Sans',
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            55.0,
                                                                        height:
                                                                            35.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: functions.getAppointmentPaidInfo(getJsonField(
                                                                            dataItem,
                                                                            r'''$.paid_amount''',
                                                                          ))
                                                                              ? const Color(0xFFE4BB31)
                                                                              : const Color(0xFFFF9900),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(15.0),
                                                                            bottomRight:
                                                                                Radius.circular(0.0),
                                                                            topLeft:
                                                                                Radius.circular(0.0),
                                                                            topRight:
                                                                                Radius.circular(10.0),
                                                                          ),
                                                                        ),
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          functions.getAppointmentPaidInfo(getJsonField(
                                                                            dataItem,
                                                                            r'''$.paid_amount''',
                                                                          ))
                                                                              ? 'Free'
                                                                              : 'Paid',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                color: Colors.white,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              functions.getAppointmentStatusInfo(getJsonField(
                                                                            dataItem,
                                                                            r'''$.status''',
                                                                          )),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                color: functions.getAppointmentStatusInfo(getJsonField(
                                                                                          dataItem,
                                                                                          r'''$.status''',
                                                                                        )) ==
                                                                                        'Pending'
                                                                                    ? const Color(0xFFFF9900)
                                                                                    : const Color(0xFF00B96D),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'sro4bcxg' /*   |   */,
                                                                          ),
                                                                          style:
                                                                              const TextStyle(
                                                                            color:
                                                                                Color(0xFF79818A),
                                                                          ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            dataItem,
                                                                            r'''$.name''',
                                                                          ).toString(),
                                                                          style:
                                                                              GoogleFonts.getFont(
                                                                            'Nunito Sans',
                                                                            color:
                                                                                const Color(0xFF79818A),
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        35.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFF6F8F9),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          const Icon(
                                                                            Icons.watch_later_outlined,
                                                                            color:
                                                                                Color(0xFFE4BB31),
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                dataItem,
                                                                                r'''$.date''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    color: const Color(0xFF79818A),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '00bqlnlz' /* • */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    color: const Color(0xFF79818A),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            functions.getAppointmentFormatedTime(
                                                                                getJsonField(
                                                                                  dataItem,
                                                                                  r'''$.from_time''',
                                                                                ).toString(),
                                                                                getJsonField(
                                                                                  dataItem,
                                                                                  r'''$.to_time''',
                                                                                ).toString()),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Nunito Sans',
                                                                                  color: const Color(0xFF79818A),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
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
                                              },
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
