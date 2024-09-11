import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'logout_dialog_box_model.dart';
export 'logout_dialog_box_model.dart';

class LogoutDialogBoxWidget extends StatefulWidget {
  const LogoutDialogBoxWidget({super.key});

  @override
  State<LogoutDialogBoxWidget> createState() => _LogoutDialogBoxWidgetState();
}

class _LogoutDialogBoxWidgetState extends State<LogoutDialogBoxWidget> {
  late LogoutDialogBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoutDialogBoxModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 350.0,
            maxHeight: 250.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/alert.png',
                    width: 65.0,
                    height: 65.0,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'zhbckfxu' /* Logout */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Nunito Sans'),
                        ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'j446pvul' /* Are you sure want to Logout? */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          color: const Color(0xFF79818A),
                          fontWeight: FontWeight.normal,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Nunito Sans'),
                        ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.safePop();
                          },
                          text: FFLocalizations.of(context).getText(
                            '1w5hmry4' /* Cancel */,
                          ),
                          options: FFButtonOptions(
                            width: 145.0,
                            height: 45.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFFF6F8F9),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: const Color(0xFF79818A),
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
                            Function() navigate = () {};
                            _model.apiResult2xw =
                                await VcardGroup.logoutCall.call(
                              authToken: FFAppState().authToken,
                              email: FFAppState().email,
                            );
                            if ((_model.apiResult2xw?.succeeded ?? true)) {
                              setAppLanguage(context, 'en');
                              FFAppState().authToken = '';
                              FFAppState().email = '';
                              FFAppState().role = '';
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              navigate = () => context.goNamedAuth(
                                  'login_screen', context.mounted);
                              await actions.customSnackbar(
                                context,
                                FFLocalizations.of(context).getVariableText(
                                  enText: 'Logout Successfully.',
                                  arText: 'تم تسجيل الخروج بنجاح.',
                                  zh_HansText: '注销成功。',
                                  frText: 'Déconnexion réussie.',
                                  deText: 'Abmelden erfolgreich.',
                                  ptText: 'Sair com sucesso.',
                                  ruText: 'Выйти успешно.',
                                  esText: 'Cerrar sesión correctamente.',
                                  trText: 'Başarıyla Oturumu Kapatın.',
                                ),
                                const Color(0xFF46A44D),
                              );
                            }

                            navigate();

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            '3jhq3lck' /* Logout */,
                          ),
                          options: FFButtonOptions(
                            width: 145.0,
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
                    ]
                        .divide(const SizedBox(width: 15.0))
                        .addToStart(const SizedBox(width: 5.0))
                        .addToEnd(const SizedBox(width: 5.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
