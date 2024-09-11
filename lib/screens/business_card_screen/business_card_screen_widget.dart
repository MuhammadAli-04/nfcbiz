import '/backend/api_requests/api_calls.dart';
import '/component/drawer/drawer_widget.dart';
import '/component/empty_data_component/empty_data_component_widget.dart';
import '/component/scan_component/scan_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'business_card_screen_model.dart';
export 'business_card_screen_model.dart';

class BusinessCardScreenWidget extends StatefulWidget {
  const BusinessCardScreenWidget({super.key});

  @override
  State<BusinessCardScreenWidget> createState() =>
      _BusinessCardScreenWidgetState();
}

class _BusinessCardScreenWidgetState extends State<BusinessCardScreenWidget> {
  late BusinessCardScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BusinessCardScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().isAPILoading = true;
      });
      if (FFAppState().role == 'Super Admin') {
        _model.groupRes = await VcardGroup.groupsCall.call(
          authToken: FFAppState().authToken,
        );
        _model.businesscardRes = await VcardGroup.businessCardCall.call(
          authToken: FFAppState().authToken,
        );
        setState(() {
          FFAppState().businessGroupList = VcardGroup.groupsCall
              .data(
                (_model.groupRes?.jsonBody ?? ''),
              )!
              .toList()
              .cast<dynamic>();
          FFAppState().businessCardList = VcardGroup.businessCardCall
              .data(
                (_model.businesscardRes?.jsonBody ?? ''),
              )!
              .toList()
              .cast<dynamic>();
        });
      } else {
        _model.adminGroupRes = await VcardGroup.adminGroupCall.call(
          authToken: FFAppState().authToken,
        );
        _model.adminBusinesscardRes =
            await VcardGroup.adminBusinessCardCall.call(
          authToken: FFAppState().authToken,
        );
        setState(() {
          FFAppState().businessGroupList = VcardGroup.adminGroupCall
              .data(
                (_model.adminGroupRes?.jsonBody ?? ''),
              )!
              .toList()
              .cast<dynamic>();
          FFAppState().businessCardList = VcardGroup.adminBusinessCardCall
              .data(
                (_model.adminBusinesscardRes?.jsonBody ?? ''),
              )!
              .toList()
              .cast<dynamic>();
        });
      }

      setState(() {
        FFAppState().isAPILoading = false;
      });
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
              'w7cj5v2s' /* Business Cards */,
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
          actions: [
            wrapWithModel(
              model: _model.scanComponentModel,
              updateCallback: () => setState(() {}),
              child: const ScanComponentWidget(
                isBusinessCardScreen: true,
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Builder(
          builder: (context) {
            if (!FFAppState().isAPILoading) {
              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 10.0, 0.0, 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final data = functions
                                    .generateBusinessGroupList(
                                        FFAppState().businessGroupList.toList())
                                    .toList();
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(data.length,
                                            (dataIndex) {
                                      final dataItem = data[dataIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            FFAppState()
                                                    .selectedBusinessGroupIndex =
                                                dataIndex;
                                            FFAppState().isLoading = true;
                                          });
                                          await Future.delayed(const Duration(
                                              milliseconds: 1500));
                                          setState(() {
                                            FFAppState().isLoading = false;
                                          });
                                        },
                                        child: Container(
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: dataIndex ==
                                                    FFAppState()
                                                        .selectedBusinessGroupIndex
                                                ? const Color(0x1AE4BB31)
                                                : const Color(0xFFF6F8F9),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color: dataIndex ==
                                                      FFAppState()
                                                          .selectedBusinessGroupIndex
                                                  ? const Color(0xFFE4BB31)
                                                  : const Color(0x00FFFFFF),
                                            ),
                                          ),
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(25.0, 0.0, 25.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                dataItem,
                                                r'''$''',
                                              ).toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: dataIndex ==
                                                            FFAppState()
                                                                .selectedBusinessGroupIndex
                                                        ? const Color(
                                                            0xFFE4BB31)
                                                        : const Color(
                                                            0xFF79818A),
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts:
                                                        GoogleFonts.asMap()
                                                            .containsKey(
                                                                'Nunito Sans'),
                                                  ),
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                                        .divide(const SizedBox(width: 10.0))
                                        .addToStart(const SizedBox(width: 5.0))
                                        .addToEnd(const SizedBox(width: 5.0)),
                                  ),
                                );
                              },
                            ),
                          ),
                          Flexible(
                            child: Builder(
                              builder: (context) {
                                if (FFAppState().selectedBusinessGroupIndex ==
                                    0) {
                                  return Builder(
                                    builder: (context) {
                                      final cards = functions
                                          .generateBusinessCard(
                                              FFAppState()
                                                  .businessCardList
                                                  .toList(),
                                              FFAppState()
                                                  .businessGroupList
                                                  .toList())
                                          .toList();
                                      if (cards.isEmpty) {
                                        return const EmptyDataComponentWidget();
                                      }
                                      return ListView.builder(
                                        padding: const EdgeInsets.fromLTRB(
                                          0,
                                          5.0,
                                          0,
                                          8.0,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: cards.length,
                                        itemBuilder: (context, cardsIndex) {
                                          final cardsItem = cards[cardsIndex];
                                          return Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(
                                                15.0, 15.0, 15.0, 0.0),
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: SingleChildScrollView(
                                                primary: false,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0,
                                                              0.0, 0.0, 5.0),
                                                      child: Text(
                                                        getJsonField(
                                                          cardsItem,
                                                          r'''$.name''',
                                                        ).toString(),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 18.0,
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
                                                    Builder(
                                                      builder: (context) {
                                                        final groupCard =
                                                            functions
                                                                .sortListData(
                                                                    getJsonField(
                                                                  cardsItem,
                                                                  r'''$.data''',
                                                                  true,
                                                                )!)
                                                                .toList();
                                                        if (groupCard.isEmpty) {
                                                          return const EmptyDataComponentWidget();
                                                        }
                                                        return SingleChildScrollView(
                                                          primary: false,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: List.generate(
                                                                    groupCard
                                                                        .length,
                                                                    (groupCardIndex) {
                                                              final groupCardItem =
                                                                  groupCard[
                                                                      groupCardIndex];
                                                              return Builder(
                                                                builder:
                                                                    (context) {
                                                                  if (getJsonField(
                                                                        groupCardItem,
                                                                        r'''$.vcard_id''',
                                                                      ) !=
                                                                      null) {
                                                                    return Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (FFAppState().selectLanguageIndex ==
                                                                            0) {
                                                                          return Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                2.0,
                                                                                2.0,
                                                                                0.0),
                                                                            child:
                                                                                Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 2.0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                              ),
                                                                              child: Container(
                                                                                width: double.infinity,
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
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 10.0, 15.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  await launchURL(
                                                                                                      getJsonField(
                                                                                                        groupCardItem,
                                                                                                        r'''$.url''',
                                                                                                      ).toString(),
                                                                                                      context);
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 40.0,
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Colors.white,
                                                                                                    image: DecorationImage(
                                                                                                      fit: BoxFit.contain,
                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                      image: Image.asset(
                                                                                                        'assets/images/share.png',
                                                                                                      ).image,
                                                                                                    ),
                                                                                                    borderRadius: const BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(15.0),
                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                      topLeft: Radius.circular(0.0),
                                                                                                      topRight: Radius.circular(10.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      getJsonField(
                                                                                                        groupCardItem,
                                                                                                        r'''$.name''',
                                                                                                      ).toString(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Nunito Sans',
                                                                                                            fontSize: 16.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                                          ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                      child: RichText(
                                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                                        text: TextSpan(
                                                                                                          children: [
                                                                                                            TextSpan(
                                                                                                              text: getJsonField(
                                                                                                                groupCardItem,
                                                                                                                r'''$.occupation''',
                                                                                                              ).toString(),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Nunito Sans',
                                                                                                                    color: const Color(0xFF79818A),
                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                                                  ),
                                                                                                            ),
                                                                                                            TextSpan(
                                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                                'a19bsrp1' /*   |   */,
                                                                                                              ),
                                                                                                              style: const TextStyle(
                                                                                                                color: Color(0xFF79818A),
                                                                                                              ),
                                                                                                            ),
                                                                                                            TextSpan(
                                                                                                              text: functions.formatDate(getJsonField(
                                                                                                                groupCardItem,
                                                                                                                r'''$.created_at''',
                                                                                                              ).toString()),
                                                                                                              style: GoogleFonts.getFont(
                                                                                                                'Nunito Sans',
                                                                                                                color: const Color(0xFF79818A),
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                              ),
                                                                                                            )
                                                                                                          ],
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                        ),
                                                                                                        textAlign: TextAlign.start,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            ClipRRect(
                                                                                              borderRadius: const BorderRadius.only(
                                                                                                bottomLeft: Radius.circular(50.0),
                                                                                                bottomRight: Radius.circular(50.0),
                                                                                                topLeft: Radius.circular(50.0),
                                                                                                topRight: Radius.circular(50.0),
                                                                                              ),
                                                                                              child: Image.network(
                                                                                                getJsonField(
                                                                                                  groupCardItem,
                                                                                                  r'''$.vcard_image''',
                                                                                                ).toString(),
                                                                                                width: 50.0,
                                                                                                height: 50.0,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 12.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  setState(() {
                                                                                                    FFAppState().isContactSaving = true;
                                                                                                  });
                                                                                                  await actions.saveContact(
                                                                                                    getJsonField(
                                                                                                      groupCardItem,
                                                                                                      r'''$.name''',
                                                                                                    ).toString(),
                                                                                                    getJsonField(
                                                                                                      groupCardItem,
                                                                                                      r'''$.group_name''',
                                                                                                    ).toString(),
                                                                                                    getJsonField(
                                                                                                      groupCardItem,
                                                                                                      r'''$.phone''',
                                                                                                    ).toString(),
                                                                                                    getJsonField(
                                                                                                      groupCardItem,
                                                                                                      r'''$.alternative_phone''',
                                                                                                    ).toString(),
                                                                                                    getJsonField(
                                                                                                      groupCardItem,
                                                                                                      r'''$.vcard_image''',
                                                                                                    ).toString(),
                                                                                                  );
                                                                                                },
                                                                                                child: Container(
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: const Color(0xFFF6F8F9),
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                                        child: Image.asset(
                                                                                                          'assets/images/add_contact.png',
                                                                                                          fit: BoxFit.contain,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Builder(
                                                                                                builder: (context) => InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    await Share.share(
                                                                                                      getJsonField(
                                                                                                        groupCardItem,
                                                                                                        r'''$.url''',
                                                                                                      ).toString(),
                                                                                                      sharePositionOrigin: getWidgetBoundingBox(context),
                                                                                                    );
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    height: 40.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: const Color(0xFFF6F8F9),
                                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                                    ),
                                                                                                    child: Align(
                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(0.0),
                                                                                                          child: Image.asset(
                                                                                                            'assets/images/share_card.png',
                                                                                                            fit: BoxFit.contain,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  await launchURL(
                                                                                                      'whatsapp://send?phone=${getJsonField(
                                                                                                        groupCardItem,
                                                                                                        r'''$.phone''',
                                                                                                      ).toString()}',
                                                                                                      context);
                                                                                                },
                                                                                                child: Container(
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: const Color(0xFFF6F8F9),
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                                        child: Image.asset(
                                                                                                          'assets/images/whatsapp.png',
                                                                                                          fit: BoxFit.contain,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(const SizedBox(width: 10.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          return Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                2.0,
                                                                                2.0,
                                                                                0.0),
                                                                            child:
                                                                                Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 2.0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                              ),
                                                                              child: Container(
                                                                                width: double.infinity,
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
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 0.0, 15.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            ClipRRect(
                                                                                              borderRadius: const BorderRadius.only(
                                                                                                bottomLeft: Radius.circular(50.0),
                                                                                                bottomRight: Radius.circular(50.0),
                                                                                                topLeft: Radius.circular(50.0),
                                                                                                topRight: Radius.circular(50.0),
                                                                                              ),
                                                                                              child: Image.network(
                                                                                                getJsonField(
                                                                                                  groupCardItem,
                                                                                                  r'''$.vcard_image''',
                                                                                                ).toString(),
                                                                                                width: 50.0,
                                                                                                height: 50.0,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      getJsonField(
                                                                                                        groupCardItem,
                                                                                                        r'''$.name''',
                                                                                                      ).toString(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Nunito Sans',
                                                                                                            fontSize: 16.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                                          ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                      child: RichText(
                                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                                        text: TextSpan(
                                                                                                          children: [
                                                                                                            TextSpan(
                                                                                                              text: getJsonField(
                                                                                                                groupCardItem,
                                                                                                                r'''$.occupation''',
                                                                                                              ).toString(),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Nunito Sans',
                                                                                                                    color: const Color(0xFF79818A),
                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                                                  ),
                                                                                                            ),
                                                                                                            TextSpan(
                                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                                'yiciai6r' /*   |   */,
                                                                                                              ),
                                                                                                              style: const TextStyle(
                                                                                                                color: Color(0xFF79818A),
                                                                                                              ),
                                                                                                            ),
                                                                                                            TextSpan(
                                                                                                              text: functions.formatDate(getJsonField(
                                                                                                                groupCardItem,
                                                                                                                r'''$.created_at''',
                                                                                                              ).toString()),
                                                                                                              style: GoogleFonts.getFont(
                                                                                                                'Nunito Sans',
                                                                                                                color: const Color(0xFF79818A),
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                              ),
                                                                                                            )
                                                                                                          ],
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                        ),
                                                                                                        textAlign: TextAlign.start,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  await launchURL(
                                                                                                      getJsonField(
                                                                                                        groupCardItem,
                                                                                                        r'''$.url''',
                                                                                                      ).toString(),
                                                                                                      context);
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 40.0,
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Colors.white,
                                                                                                    image: DecorationImage(
                                                                                                      fit: BoxFit.fill,
                                                                                                      image: Image.asset(
                                                                                                        'assets/images/share.png',
                                                                                                      ).image,
                                                                                                    ),
                                                                                                    borderRadius: const BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(15.0),
                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                      topLeft: Radius.circular(0.0),
                                                                                                      topRight: Radius.circular(10.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 10.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  setState(() {
                                                                                                    FFAppState().isContactSaving = true;
                                                                                                  });
                                                                                                  await actions.saveContact(
                                                                                                    getJsonField(
                                                                                                      groupCardItem,
                                                                                                      r'''$.name''',
                                                                                                    ).toString(),
                                                                                                    getJsonField(
                                                                                                      groupCardItem,
                                                                                                      r'''$.group_name''',
                                                                                                    ).toString(),
                                                                                                    getJsonField(
                                                                                                      groupCardItem,
                                                                                                      r'''$.phone''',
                                                                                                    ).toString(),
                                                                                                    getJsonField(
                                                                                                      groupCardItem,
                                                                                                      r'''$.alternative_phone''',
                                                                                                    ).toString(),
                                                                                                    getJsonField(
                                                                                                      groupCardItem,
                                                                                                      r'''$.vcard_image''',
                                                                                                    ).toString(),
                                                                                                  );
                                                                                                },
                                                                                                child: Container(
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: const Color(0xFFF6F8F9),
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                                        child: Image.asset(
                                                                                                          'assets/images/add_contact.png',
                                                                                                          fit: BoxFit.contain,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Builder(
                                                                                                builder: (context) => InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    await Share.share(
                                                                                                      getJsonField(
                                                                                                        groupCardItem,
                                                                                                        r'''$.url''',
                                                                                                      ).toString(),
                                                                                                      sharePositionOrigin: getWidgetBoundingBox(context),
                                                                                                    );
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    height: 40.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: const Color(0xFFF6F8F9),
                                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                                    ),
                                                                                                    child: Align(
                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(0.0),
                                                                                                          child: Image.asset(
                                                                                                            'assets/images/share_card.png',
                                                                                                            fit: BoxFit.contain,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  await launchURL(
                                                                                                      'whatsapp://send?phone=${getJsonField(
                                                                                                        groupCardItem,
                                                                                                        r'''$.phone''',
                                                                                                      ).toString()}',
                                                                                                      context);
                                                                                                },
                                                                                                child: Container(
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: const Color(0xFFF6F8F9),
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                                        child: Image.asset(
                                                                                                          'assets/images/whatsapp.png',
                                                                                                          fit: BoxFit.contain,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(const SizedBox(width: 10.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                    );
                                                                  } else {
                                                                    return Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (FFAppState().selectLanguageIndex ==
                                                                            0) {
                                                                          return Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                2.0,
                                                                                2.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 2.0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                              ),
                                                                              child: Container(
                                                                                width: double.infinity,
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
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 10.0, 15.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  await launchURL(
                                                                                                      getJsonField(
                                                                                                        groupCardItem,
                                                                                                        r'''$.url''',
                                                                                                      ).toString(),
                                                                                                      context);
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 40.0,
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Colors.white,
                                                                                                    image: DecorationImage(
                                                                                                      fit: BoxFit.fill,
                                                                                                      image: Image.asset(
                                                                                                        'assets/images/share.png',
                                                                                                      ).image,
                                                                                                    ),
                                                                                                    borderRadius: const BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(15.0),
                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                      topLeft: Radius.circular(0.0),
                                                                                                      topRight: Radius.circular(10.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      getJsonField(
                                                                                                        groupCardItem,
                                                                                                        r'''$.url''',
                                                                                                      ).toString(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Nunito Sans',
                                                                                                            fontSize: 16.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 12.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Builder(
                                                                                                builder: (context) => InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    await Share.share(
                                                                                                      getJsonField(
                                                                                                        groupCardItem,
                                                                                                        r'''$.url''',
                                                                                                      ).toString(),
                                                                                                      sharePositionOrigin: getWidgetBoundingBox(context),
                                                                                                    );
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    height: 40.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: const Color(0xFFF6F8F9),
                                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                                    ),
                                                                                                    child: Align(
                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(0.0),
                                                                                                          child: Image.asset(
                                                                                                            'assets/images/share_card.png',
                                                                                                            fit: BoxFit.contain,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(const SizedBox(width: 10.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          return Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                2.0,
                                                                                2.0,
                                                                                0.0),
                                                                            child:
                                                                                Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 2.0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                              ),
                                                                              child: Container(
                                                                                width: double.infinity,
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
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 0.0, 15.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      getJsonField(
                                                                                                        groupCardItem,
                                                                                                        r'''$.url''',
                                                                                                      ).toString(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Nunito Sans',
                                                                                                            fontSize: 16.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  await launchURL(
                                                                                                      getJsonField(
                                                                                                        groupCardItem,
                                                                                                        r'''$.url''',
                                                                                                      ).toString(),
                                                                                                      context);
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 40.0,
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Colors.white,
                                                                                                    image: DecorationImage(
                                                                                                      fit: BoxFit.fill,
                                                                                                      image: Image.asset(
                                                                                                        'assets/images/share.png',
                                                                                                      ).image,
                                                                                                    ),
                                                                                                    borderRadius: const BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(15.0),
                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                      topLeft: Radius.circular(0.0),
                                                                                                      topRight: Radius.circular(10.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 10.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Builder(
                                                                                                builder: (context) => InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    await Share.share(
                                                                                                      getJsonField(
                                                                                                        groupCardItem,
                                                                                                        r'''$.url''',
                                                                                                      ).toString(),
                                                                                                      sharePositionOrigin: getWidgetBoundingBox(context),
                                                                                                    );
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    height: 40.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: const Color(0xFFF6F8F9),
                                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                                    ),
                                                                                                    child: Align(
                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(0.0),
                                                                                                          child: Image.asset(
                                                                                                            'assets/images/share_card.png',
                                                                                                            fit: BoxFit.contain,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(const SizedBox(width: 10.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                              );
                                                            })
                                                                .divide(
                                                                    const SizedBox(
                                                                        height:
                                                                            10.0))
                                                                .addToStart(
                                                                    const SizedBox(
                                                                        height:
                                                                            5.0))
                                                                .addToEnd(
                                                                    const SizedBox(
                                                                        height:
                                                                            8.0)),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                } else {
                                  return Builder(
                                    builder: (context) {
                                      if (FFAppState().isLoading) {
                                        return Align(
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: const SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child:
                                                  custom_widgets.CustomLoader(
                                                width: 50.0,
                                                height: 50.0,
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(15.0, 15.0, 15.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final cardData = functions
                                                  .sortListData(FFAppState()
                                                      .businessCardList
                                                      .where((e) =>
                                                          getJsonField(
                                                            e,
                                                            r'''$.group_name''',
                                                          ) ==
                                                          getJsonField(
                                                            FFAppState()
                                                                    .businessGroupList[
                                                                functions.decreaseIndex(
                                                                    FFAppState()
                                                                        .selectedBusinessGroupIndex)],
                                                            r'''$.name''',
                                                          ))
                                                      .toList())
                                                  .toList();
                                              if (cardData.isEmpty) {
                                                return const EmptyDataComponentWidget();
                                              }
                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                          cardData.length,
                                                          (cardDataIndex) {
                                                    final cardDataItem =
                                                        cardData[cardDataIndex];
                                                    return Builder(
                                                      builder: (context) {
                                                        if (getJsonField(
                                                              cardDataItem,
                                                              r'''$.vcard_id''',
                                                            ) !=
                                                            null) {
                                                          return Builder(
                                                            builder: (context) {
                                                              if (FFAppState()
                                                                      .selectLanguageIndex ==
                                                                  0) {
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          5.0,
                                                                          2.0,
                                                                          2.0,
                                                                          0.0),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        boxShadow: const [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                0.0,
                                                                            color:
                                                                                Color(0xFFE4BB31),
                                                                            offset:
                                                                                Offset(-5.0, 0.0),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            10.0,
                                                                            15.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        await launchURL(
                                                                                            getJsonField(
                                                                                              cardDataItem,
                                                                                              r'''$.url''',
                                                                                            ).toString(),
                                                                                            context);
                                                                                      },
                                                                                      child: Container(
                                                                                        width: 40.0,
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.white,
                                                                                          image: DecorationImage(
                                                                                            fit: BoxFit.fill,
                                                                                            image: Image.asset(
                                                                                              'assets/images/share.png',
                                                                                            ).image,
                                                                                          ),
                                                                                          borderRadius: const BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(15.0),
                                                                                            bottomRight: Radius.circular(0.0),
                                                                                            topLeft: Radius.circular(0.0),
                                                                                            topRight: Radius.circular(10.0),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                                        children: [
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              cardDataItem,
                                                                                              r'''$.name''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Nunito Sans',
                                                                                                  fontSize: 16.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                                ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                            child: RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: getJsonField(
                                                                                                      cardDataItem,
                                                                                                      r'''$.occupation''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Nunito Sans',
                                                                                                          color: const Color(0xFF79818A),
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                                        ),
                                                                                                  ),
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      '9iwqms5z' /*    |    */,
                                                                                                    ),
                                                                                                    style: const TextStyle(
                                                                                                      color: Color(0xFF79818A),
                                                                                                    ),
                                                                                                  ),
                                                                                                  TextSpan(
                                                                                                    text: functions.formatDate(getJsonField(
                                                                                                      cardDataItem,
                                                                                                      r'''$.created_at''',
                                                                                                    ).toString()),
                                                                                                    style: GoogleFonts.getFont(
                                                                                                      'Nunito Sans',
                                                                                                      color: const Color(0xFF79818A),
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                              ),
                                                                                              textAlign: TextAlign.start,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  ClipRRect(
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(50.0),
                                                                                      bottomRight: Radius.circular(50.0),
                                                                                      topLeft: Radius.circular(50.0),
                                                                                      topRight: Radius.circular(50.0),
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      getJsonField(
                                                                                        cardDataItem,
                                                                                        r'''$.vcard_image''',
                                                                                      ).toString(),
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 12.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        setState(() {
                                                                                          FFAppState().isContactSaving = true;
                                                                                        });
                                                                                        await actions.saveContact(
                                                                                          getJsonField(
                                                                                            cardDataItem,
                                                                                            r'''$.name''',
                                                                                          ).toString(),
                                                                                          getJsonField(
                                                                                            cardDataItem,
                                                                                            r'''$.group_name''',
                                                                                          ).toString(),
                                                                                          getJsonField(
                                                                                            cardDataItem,
                                                                                            r'''$.phone''',
                                                                                          ).toString(),
                                                                                          getJsonField(
                                                                                            cardDataItem,
                                                                                            r'''$.alternative_phone''',
                                                                                          ).toString(),
                                                                                          getJsonField(
                                                                                            cardDataItem,
                                                                                            r'''$.vcard_image''',
                                                                                          ).toString(),
                                                                                        );
                                                                                      },
                                                                                      child: Container(
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: const Color(0xFFF6F8F9),
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/add_contact.png',
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Builder(
                                                                                      builder: (context) => InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          await Share.share(
                                                                                            getJsonField(
                                                                                              cardDataItem,
                                                                                              r'''$.url''',
                                                                                            ).toString(),
                                                                                            sharePositionOrigin: getWidgetBoundingBox(context),
                                                                                          );
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 40.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: const Color(0xFFF6F8F9),
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                child: Image.asset(
                                                                                                  'assets/images/share_card.png',
                                                                                                  fit: BoxFit.contain,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        await launchURL(
                                                                                            'whatsapp://send?phone=${getJsonField(
                                                                                              cardDataItem,
                                                                                              r'''$.phone''',
                                                                                            ).toString()}',
                                                                                            context);
                                                                                      },
                                                                                      child: Container(
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: const Color(0xFFF6F8F9),
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/whatsapp.png',
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(const SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              } else {
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          5.0,
                                                                          2.0,
                                                                          2.0,
                                                                          0.0),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        boxShadow: const [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                0.0,
                                                                            color:
                                                                                Color(0xFFE4BB31),
                                                                            offset:
                                                                                Offset(-5.0, 0.0),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            10.0,
                                                                            15.0,
                                                                            0.0,
                                                                            15.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  ClipRRect(
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(50.0),
                                                                                      bottomRight: Radius.circular(50.0),
                                                                                      topLeft: Radius.circular(50.0),
                                                                                      topRight: Radius.circular(50.0),
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      getJsonField(
                                                                                        cardDataItem,
                                                                                        r'''$.vcard_image''',
                                                                                      ).toString(),
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              cardDataItem,
                                                                                              r'''$.name''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Nunito Sans',
                                                                                                  fontSize: 16.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                                ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                            child: RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: getJsonField(
                                                                                                      cardDataItem,
                                                                                                      r'''$.occupation''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Nunito Sans',
                                                                                                          color: const Color(0xFF79818A),
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                                        ),
                                                                                                  ),
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      'l18wkyym' /*   |   */,
                                                                                                    ),
                                                                                                    style: const TextStyle(
                                                                                                      color: Color(0xFF79818A),
                                                                                                    ),
                                                                                                  ),
                                                                                                  TextSpan(
                                                                                                    text: functions.formatDate(getJsonField(
                                                                                                      cardDataItem,
                                                                                                      r'''$.created_at''',
                                                                                                    ).toString()),
                                                                                                    style: GoogleFonts.getFont(
                                                                                                      'Nunito Sans',
                                                                                                      color: const Color(0xFF79818A),
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                              ),
                                                                                              textAlign: TextAlign.start,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        await launchURL(
                                                                                            getJsonField(
                                                                                              cardDataItem,
                                                                                              r'''$.url''',
                                                                                            ).toString(),
                                                                                            context);
                                                                                      },
                                                                                      child: Container(
                                                                                        width: 40.0,
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.white,
                                                                                          image: DecorationImage(
                                                                                            fit: BoxFit.fill,
                                                                                            image: Image.asset(
                                                                                              'assets/images/share.png',
                                                                                            ).image,
                                                                                          ),
                                                                                          borderRadius: const BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(15.0),
                                                                                            bottomRight: Radius.circular(0.0),
                                                                                            topLeft: Radius.circular(0.0),
                                                                                            topRight: Radius.circular(10.0),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 10.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        setState(() {
                                                                                          FFAppState().isContactSaving = true;
                                                                                        });
                                                                                        await actions.saveContact(
                                                                                          getJsonField(
                                                                                            cardDataItem,
                                                                                            r'''$.name''',
                                                                                          ).toString(),
                                                                                          getJsonField(
                                                                                            cardDataItem,
                                                                                            r'''$.group_name''',
                                                                                          ).toString(),
                                                                                          getJsonField(
                                                                                            cardDataItem,
                                                                                            r'''$.phone''',
                                                                                          ).toString(),
                                                                                          getJsonField(
                                                                                            cardDataItem,
                                                                                            r'''$.alternative_phone''',
                                                                                          ).toString(),
                                                                                          getJsonField(
                                                                                            cardDataItem,
                                                                                            r'''$.vcard_image''',
                                                                                          ).toString(),
                                                                                        );
                                                                                      },
                                                                                      child: Container(
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: const Color(0xFFF6F8F9),
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/add_contact.png',
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Builder(
                                                                                      builder: (context) => InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          await Share.share(
                                                                                            getJsonField(
                                                                                              cardDataItem,
                                                                                              r'''$.url''',
                                                                                            ).toString(),
                                                                                            sharePositionOrigin: getWidgetBoundingBox(context),
                                                                                          );
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 40.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: const Color(0xFFF6F8F9),
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                child: Image.asset(
                                                                                                  'assets/images/share_card.png',
                                                                                                  fit: BoxFit.contain,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        await launchURL(
                                                                                            'whatsapp://send?phone=${getJsonField(
                                                                                              cardDataItem,
                                                                                              r'''$.phone''',
                                                                                            ).toString()}',
                                                                                            context);
                                                                                      },
                                                                                      child: Container(
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: const Color(0xFFF6F8F9),
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/whatsapp.png',
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(const SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          );
                                                        } else {
                                                          return Builder(
                                                            builder: (context) {
                                                              if (FFAppState()
                                                                      .selectLanguageIndex ==
                                                                  0) {
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          2.0,
                                                                          2.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        boxShadow: const [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                0.0,
                                                                            color:
                                                                                Color(0xFFE4BB31),
                                                                            offset:
                                                                                Offset(-5.0, 0.0),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            10.0,
                                                                            15.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        await launchURL(
                                                                                            getJsonField(
                                                                                              cardDataItem,
                                                                                              r'''$.url''',
                                                                                            ).toString(),
                                                                                            context);
                                                                                      },
                                                                                      child: Container(
                                                                                        width: 40.0,
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.white,
                                                                                          image: DecorationImage(
                                                                                            fit: BoxFit.fill,
                                                                                            image: Image.asset(
                                                                                              'assets/images/share.png',
                                                                                            ).image,
                                                                                          ),
                                                                                          borderRadius: const BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(15.0),
                                                                                            bottomRight: Radius.circular(0.0),
                                                                                            topLeft: Radius.circular(0.0),
                                                                                            topRight: Radius.circular(10.0),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                                        children: [
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              cardDataItem,
                                                                                              r'''$.url''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Nunito Sans',
                                                                                                  fontSize: 16.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 12.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Builder(
                                                                                      builder: (context) => InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          await Share.share(
                                                                                            getJsonField(
                                                                                              cardDataItem,
                                                                                              r'''$.url''',
                                                                                            ).toString(),
                                                                                            sharePositionOrigin: getWidgetBoundingBox(context),
                                                                                          );
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 40.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: const Color(0xFFF6F8F9),
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                child: Image.asset(
                                                                                                  'assets/images/share_card.png',
                                                                                                  fit: BoxFit.contain,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(const SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              } else {
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          5.0,
                                                                          2.0,
                                                                          2.0,
                                                                          0.0),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        boxShadow: const [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                0.0,
                                                                            color:
                                                                                Color(0xFFE4BB31),
                                                                            offset:
                                                                                Offset(-5.0, 0.0),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            10.0,
                                                                            15.0,
                                                                            0.0,
                                                                            15.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              cardDataItem,
                                                                                              r'''$.url''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Nunito Sans',
                                                                                                  fontSize: 16.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        await launchURL(
                                                                                            getJsonField(
                                                                                              cardDataItem,
                                                                                              r'''$.url''',
                                                                                            ).toString(),
                                                                                            context);
                                                                                      },
                                                                                      child: Container(
                                                                                        width: 40.0,
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.white,
                                                                                          image: DecorationImage(
                                                                                            fit: BoxFit.fill,
                                                                                            image: Image.asset(
                                                                                              'assets/images/share.png',
                                                                                            ).image,
                                                                                          ),
                                                                                          borderRadius: const BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(15.0),
                                                                                            bottomRight: Radius.circular(0.0),
                                                                                            topLeft: Radius.circular(0.0),
                                                                                            topRight: Radius.circular(10.0),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 10.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Builder(
                                                                                      builder: (context) => InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          await Share.share(
                                                                                            getJsonField(
                                                                                              cardDataItem,
                                                                                              r'''$.url''',
                                                                                            ).toString(),
                                                                                            sharePositionOrigin: getWidgetBoundingBox(context),
                                                                                          );
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 40.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: const Color(0xFFF6F8F9),
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                child: Image.asset(
                                                                                                  'assets/images/share_card.png',
                                                                                                  fit: BoxFit.contain,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(const SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          );
                                                        }
                                                      },
                                                    );
                                                  })
                                                      .divide(const SizedBox(
                                                          height: 10.0))
                                                      .addToStart(
                                                          const SizedBox(
                                                              height: 5.0))
                                                      .addToEnd(const SizedBox(
                                                          height: 8.0)),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      }
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (FFAppState().isContactSaving)
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0x27000000),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.CustomLoader(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            } else {
              return const Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.CustomLoader(
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
