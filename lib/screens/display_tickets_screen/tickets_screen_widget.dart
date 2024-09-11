// import '/backend/api_requests/api_calls.dart';
import 'dart:async';

import 'package:nfc_biz/backend/api_requests/api_calls.dart';
import 'package:nfc_biz/component/ticket/ticket.dart';

import '/component/drawer/drawer_widget.dart';
import '/component/empty_data_component/empty_data_component_widget.dart'; // no data available
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tickets_screen_model.dart';
export 'tickets_screen_model.dart';

import "../../backend/schema/enums/ticket_enums.dart";

class TicketsScreenWidget extends StatefulWidget {
  const TicketsScreenWidget({super.key});

  @override
  State<TicketsScreenWidget> createState() => _TicketsScreenWidgetState();
}

class _TicketsScreenWidgetState extends State<TicketsScreenWidget> {
  late TicketsScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<dynamic> parentData = [];
  List<dynamic> ticketsData = [];

  // ? for pagination
  int page = 1;
  int lastPage = 1;

  Timer? _timer;
  String? profileImg;

  Future<bool> setParentData(int page) async {
    // if (mounted) {
    // }
    debugPrint("setParentData called");
    setState(() {
      FFAppState().isAPILoading = true;
    });

    // add precautionary measures
    final ApiCallResponse response = await FetchTicketsCall().call(
      // email: "test@vcard.com",
      page: page.toString(),
    );

    if (response.succeeded) {
      parentData = response.jsonBody["data"]["data"];
      setFilteredData(filter);

      // ? for pagination
      page = response.jsonBody["data"]["current_page"];
      lastPage = response.jsonBody["data"]["last_page"];
    } else {
      if (mounted) {
        await actions.customSnackbar(
          context,
          FFLocalizations.of(context).getVariableText(
            enText: 'Error fetching Tickets.',
            arText: 'خطأ في جلب التذاكر.',
            zh_HansText: '获取票据时出错.',
            frText: 'Erreur lors de la récupération des billets.',
            deText: 'Fehler beim Abrufen der Tickets.',
            ptText: 'Erro ao buscar os ingressos.',
            ruText: 'Ошибка при получении билетов.',
            esText: 'Error al obtener los tickets.',
            trText: 'Biletler getirilirken hata oluştu.',
          ),
          FlutterFlowTheme.of(context).error,
        );
      }
    }

    setState(() {
      FFAppState().isAPILoading = false;
    });
    // if (mounted) {
    // }
    return response.succeeded;
  }

  //? for applying filter {private, public, etc.}
  TicketFilter filter = TicketFilter.all;

  void setFilteredData(TicketFilter filter) {
    if (parentData.isNotEmpty) {
      switch (filter) {
        case TicketFilter.private:
          ticketsData = parentData
              .map((ticket) => !ticket["is_public"] ? ticket : null)
              .withoutNulls
              .toList();
          break;
        case TicketFilter.public:
          ticketsData = parentData
              .map((ticket) => ticket["is_public"] ? ticket : null)
              .withoutNulls
              .toList();
          break;
        case TicketFilter.all:
          ticketsData = parentData.map((ticket) => ticket).toList();
          break;
      }
    }
  }

  void startTimer() {
    // _timer = Timer.periodic(const Duration(seconds: 15), (timer) async {
    //   await setParentData(page);
    // });
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TicketsScreenModel());
    startTimer();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().isAPILoading = true;
      });
      final response = await VcardGroup.profileCall.call(
        authToken: FFAppState().authToken,
      );
      profileImg = VcardGroup.profileCall.image(
        response.jsonBody,
      );
      await setParentData(page);
    });
  }

  @override
  void didChangeDependencies() {
    // SchedulerBinding.instance.addPostFrameCallback((_) async {
    //   await setParentData(page);
    // });

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _model.dispose();
    _timer?.cancel();
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
              'k9b343zv' /* Tickets */,
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
        body: RefreshIndicator(
          onRefresh: () async {
            setParentData(page);
          },
          child: Builder(
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
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        final data = functions
                                            .generateTicketsTypeList(
                                                FFAppState()
                                                    .ticketsTypeList
                                                    .toList()
                                                // +
                                                // [
                                                //   {"name": "Private"},
                                                //   {"name": "Public"},
                                                // ],
                                                )
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
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (mounted) {
                                                    setState(() {
                                                      FFAppState()
                                                          .isAPILoading = true;
                                                    });
                                                  }
                                                  FFAppState()
                                                          .selectedTicketTypeIndex =
                                                      dataIndex;
                                                  filter = getTicketFilter(
                                                      getJsonField(
                                                    dataItem,
                                                    r'''$''',
                                                  ).toString().trim());
                                                  setFilteredData(filter);

                                                  if (mounted) {
                                                    setState(() {
                                                      FFAppState()
                                                          .isAPILoading = false;
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    border: Border.all(
                                                      color: dataIndex ==
                                                              FFAppState()
                                                                  .selectedTicketTypeIndex
                                                          ? const Color(
                                                              0xFFE4BB31)
                                                          : const Color(
                                                              0x00FFFFFF),
                                                    ),
                                                  ),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(25.0, 0.0,
                                                            25.0, 0.0),
                                                    child: Text(
                                                      getJsonField(
                                                        dataItem,
                                                        r'''$''',
                                                      ).toString().trim(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: dataIndex ==
                                                                    FFAppState()
                                                                        .selectedTicketTypeIndex
                                                                ? const Color(
                                                                    0xFFE4BB31)
                                                                : const Color(
                                                                    0xFF79818A),
                                                            fontSize: 15.0,
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
                                                ),
                                              );
                                            })
                                                .divide(
                                                    const SizedBox(width: 10.0))
                                                .addToStart(
                                                    const SizedBox(width: 5.0))
                                                .addToEnd(
                                                    const SizedBox(width: 5.0)),
                                          ),
                                        );
                                      },
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFE4BB31),
                                        elevation: 5.0,
                                      ),
                                      onPressed: () {
                                        context.pushNamed(
                                          "create_ticket_screen",
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
                                        ).then((value) => setParentData(page));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Create New",
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  color: Colors.white,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts:
                                                      GoogleFonts.asMap()
                                                          .containsKey(
                                                              'Nunito Sans'),
                                                ),
                                          ),
                                          const SizedBox(width: 2.0),
                                          const Icon(
                                            Icons.add,
                                            size: 16.0,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Builder(
                                builder: (context) {
                                  // if (FFAppState().selectedTicketTypeIndex ==
                                  //     0) {
                                  return Builder(
                                    builder: (context) {
                                      final tickets =
                                          ticketsData; // add tickets data here
                                      if (tickets.isEmpty) {
                                        return const EmptyDataComponentWidget();
                                      }
                                      return ListView.builder(
                                        padding: const EdgeInsets.fromLTRB(
                                          0,
                                          5.0,
                                          0,
                                          8.0,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: tickets.length,
                                        itemBuilder: (context, ticketsIndex) {
                                          final ticketsItem =
                                              tickets[ticketsIndex];
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
                                                      child: Ticket(
                                                        ticketsItem:
                                                            ticketsItem,
                                                        profileImg: profileImg,
                                                      ),
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
                                }
                                // },
                                ,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    if (page == 1) {
                                      await actions.customSnackbar(
                                        context,
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: 'On first page already.',
                                          arText:
                                              'أنت بالفعل في الصفحة الأولى.',
                                          zh_HansText: '已经在第一页了.',
                                          frText: 'Déjà sur la première page.',
                                          deText:
                                              'Bereits auf der ersten Seite.',
                                          ptText: 'Já está na primeira página.',
                                          ruText: 'Уже на первой странице.',
                                          esText:
                                              'Ya está en la primera página.',
                                          trText: 'Zaten ilk sayfadasınız.',
                                        ),
                                        const Color(0xFFE4BB31),
                                      );
                                      return;
                                    }
                                    page -= 1;
                                    await setParentData(page);
                                  },
                                  color: const Color(0xFFE4BB31),
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                  ),
                                ),
                                Text("Showing Page $page of $lastPage"),
                                IconButton(
                                  onPressed: () async {
                                    if (page == lastPage) {
                                      await actions.customSnackbar(
                                        context,
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: 'On last page already.',
                                          arText:
                                              'أنت بالفعل في الصفحة الأخيرة.',
                                          zh_HansText: '已经在最后一页了.',
                                          frText: 'Déjà sur la dernière page.',
                                          deText:
                                              'Bereits auf der letzten Seite.',
                                          ptText: 'Já está na última página.',
                                          ruText: 'Уже на последней странице.',
                                          esText:
                                              'Ya está en la última página.',
                                          trText: 'Zaten son sayfadasınız.',
                                        ),
                                        const Color(0xFFE4BB31),
                                      );
                                      return;
                                    }
                                    page += 1;
                                    await setParentData(page);
                                  },
                                  color: const Color(0xFFE4BB31),
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // if (FFAppState().isContactSaving)
                    //   Container(
                    //     width: double.infinity,
                    //     height: double.infinity,
                    //     decoration: const BoxDecoration(
                    //       color: Color(0x27000000),
                    //     ),
                    //     child: Align(
                    //       alignment: const AlignmentDirectional(0.0, 0.0),
                    //       child: Container(
                    //         width: 100.0,
                    //         height: 100.0,
                    //         decoration: BoxDecoration(
                    //           color: FlutterFlowTheme.of(context)
                    //               .secondaryBackground,
                    //           borderRadius: BorderRadius.circular(15.0),
                    //         ),
                    //         child: const SizedBox(
                    //           width: double.infinity,
                    //           height: double.infinity,
                    //           child: custom_widgets.CustomLoader(
                    //             width: double.infinity,
                    //             height: double.infinity,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
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
      ),
    );
  }
}
