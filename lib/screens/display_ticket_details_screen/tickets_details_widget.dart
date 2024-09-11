// import '/backend/api_requests/api_calls.dart';
import 'package:nfc_biz/backend/api_requests/api_calls.dart';
import 'package:nfc_biz/component/ticket_details_card/ticket_details_card.dart';

import '/component/drawer/drawer_widget.dart';
import '/component/empty_data_component/empty_data_component_widget.dart'; // no data available
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tickets_details_model.dart';
export 'tickets_details_model.dart';

class TicketDetailsWidget extends StatefulWidget {
  const TicketDetailsWidget(
      {super.key,
      required this.ticketID,
      required this.customerName,
      required this.categoryName});

  final int ticketID;
  final String customerName;
  final String categoryName;

  @override
  State<TicketDetailsWidget> createState() => _TicketDetailsWidgetState();
}

class _TicketDetailsWidgetState extends State<TicketDetailsWidget> {
  late TicketDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, dynamic> ticketData = {};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TicketDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (mounted) {
        setState(() {
          FFAppState().isAPILoading = true;
        });
      }

      debugPrint("ticketId: ${widget.ticketID}");
      final response =
          await FetchSingleTicketDataCall().call(id: widget.ticketID);
      if (response.succeeded) {
        debugPrint("ticketData:");
        ticketData = response.jsonBody["data"];
        debugPrint(ticketData.toString());
      } else {
        debugPrint(" >>>>> error");
        debugPrint(response.jsonBody.toString());
        if (mounted) {
          await actions.customSnackbar(
              context,
              FFLocalizations.of(context).getVariableText(
                enText: 'Error fetching Ticket Details.',
                arText: 'خطأ في جلب تفاصيل التذكرة.',
                zh_HansText: '获取票据详情时出错.',
                frText: 'Erreur lors de la récupération des détails du billet.',
                deText: 'Fehler beim Abrufen der Ticketdetails.',
                ptText: 'Erro ao buscar os detalhes do ingresso.',
                ruText: 'Ошибка при получении деталей билета.',
                esText: 'Error al obtener detalles del ticket.',
                trText: 'Bilet detayları getirilirken hata oluştu.',
              ),
              FlutterFlowTheme.of(context).error);
        }
      }

      if (mounted) {
        setState(() {
          FFAppState().isAPILoading = false;
        });
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
              'k9d8s3jl' /* Ticket Details */,
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
        body: Builder(
          builder: (context) {
            if (!FFAppState().isAPILoading) {
              return ticketData.isEmpty
                  ? const EmptyDataComponentWidget()
                  : Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 16.0, 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TicketDetailsCard(
                              ticketDetails: ticketData,
                              customerName: widget.customerName,
                              categoryName: widget.categoryName,
                            ),
                          ],
                        ),
                      ),
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
