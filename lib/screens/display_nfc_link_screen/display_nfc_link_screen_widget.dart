import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfc_biz/flutter_flow/flutter_flow_widgets.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '/component/drawer/drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'display_nfc_link_screen_model.dart';

export 'display_nfc_link_screen_model.dart';

class DisplayNFCLinkScreenWidget extends StatefulWidget {
  const DisplayNFCLinkScreenWidget({super.key});

  @override
  State<DisplayNFCLinkScreenWidget> createState() =>
      _DisplayNFCLinkScreenWidgetState();
}

class _DisplayNFCLinkScreenWidgetState
    extends State<DisplayNFCLinkScreenWidget> {
  late DisplayNFCLinkScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final linkController = TextEditingController();
  final descriptionController = TextEditingController();
  String selectedCategory = "Custom URL";
  List<String> urlCategories = getURLCategories();

  final uuid = const Uuid();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisplayNFCLinkScreenModel());
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
              'y8c3d2ml' /* NFC Link */,
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
          child: GestureDetector(
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.85,
              child: Column(
                children: [
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "VCards",
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 16.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      context.safePop();
                      if (FFAppState().selectedDrawerPage != 'VCards') {
                        context.goNamed(
                          'vcard_screen',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 300),
                            ),
                          },
                        );
                      }
                      FFAppState().selectedDrawerPage = 'VCards';
                    },
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView.separated(
                      itemCount: urlCategories.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) => InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            urlCategories[index],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 16.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Nunito Sans'),
                                ),
                          ),
                        ),
                        onTap: () {
                          context.pushNamed("display_nfc_links_list_screen",
                              queryParameters: {
                                "category": urlCategories[index]
                              });
                        },
                      ),
                    ),
                  ),
                  gapY(),
                  gapY(),
                  // FFButtonWidget(
                  //   onPressed: () async {
                  //     context.pushNamed('create_nfc_link_screen');
                  //   },
                  //   text: FFLocalizations.of(context).getText(
                  //     'kcglmo2n' /* Create New + */,
                  //   ),
                  //   options: FFButtonOptions(
                  //     width: double.infinity,
                  //     height: 50.0,
                  //     padding: const EdgeInsetsDirectional.fromSTEB(
                  //         24.0, 0.0, 24.0, 0.0),
                  //     iconPadding: const EdgeInsetsDirectional.fromSTEB(
                  //         0.0, 0.0, 0.0, 0.0),
                  //     color: const Color(0xFFE4BB31),
                  //     textStyle:
                  //         FlutterFlowTheme.of(context).titleSmall.override(
                  //               fontFamily: 'Nunito Sans',
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold,
                  //               useGoogleFonts: GoogleFonts.asMap()
                  //                   .containsKey('Nunito Sans'),
                  //             ),
                  //     elevation: 0.0,
                  //     borderSide: const BorderSide(
                  //       color: Colors.transparent,
                  //       width: 1.0,
                  //     ),
                  //     borderRadius: BorderRadius.circular(8.0),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
