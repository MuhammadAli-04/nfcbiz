import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfc_biz/backend/api_requests/api_calls.dart';
import 'package:nfc_biz/component/ticket_details_card/reply.dart';
import 'package:nfc_biz/flutter_flow/flutter_flow_widgets.dart';
import '/component/empty_data_component/empty_data_component_widget.dart'; // no data available

import '/custom_code/actions/index.dart' as actions;

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';

import "package:file_picker/file_picker.dart";

class TicketDetailsCard extends StatefulWidget {
  const TicketDetailsCard(
      {super.key,
      required this.ticketDetails,
      required this.customerName,
      required this.categoryName});

  final Map<String, dynamic> ticketDetails;
  final String customerName;
  final String categoryName;

  @override
  State<TicketDetailsCard> createState() => _TicketDetailsCardState();
}

class _TicketDetailsCardState extends State<TicketDetailsCard> {
  int fileSizeLimitInBytes = 2097152;

  List<dynamic> replies = [];
  List<PlatformFile> attachments = [];

  bool isSendingReply = false;

  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      await updateReplies();
    });
  }

  Future<bool> sendReply({
    // String email = "test@vcard.com",
    required String ticketID,
    required String description,
    String file = "",
  }) async {
    if (mounted) {
      setState(() {
        isSendingReply = true;
      });
    }

    ApiCallResponse response = await AddReplyCall().call(
      // email: email,
      ticketID: ticketID,
      description: description,
      files: attachments.map((file) => File(file.path!)).toList(),
    );

    if (response.succeeded) {
      if (response.jsonBody["success"] ?? false) {
        final ticketResponse =
            await FetchSingleTicketDataCall().call(id: int.parse(ticketID));
        if (ticketResponse.succeeded) {
          replies = ticketResponse.jsonBody["data"]["replay"];
        } else {
          if (mounted) {
            setState(() {
              isSendingReply = false;
            });
            return false;
          }
        }
        replyController.text = "";
        attachments = [];

        if (mounted) {
          setState(() {
            isSendingReply = false;
          });
        }

        return true;
      } else {
        if (mounted) {
          actions.customSnackbar(
            context,
            FFLocalizations.of(context).getVariableText(
              enText: 'Error sending reply',
              arText: 'حدث خطأ أثناء إرسال الرد',
              zh_HansText: '发送回复时出错',
              frText: 'Erreur lors de l\'envoi de la réponse',
              deText: 'Fehler beim Senden der Antwort',
              ptText: 'Erro ao enviar a resposta',
              ruText: 'Ошибка при отправке ответа',
              esText: 'Error al enviar la respuesta',
              trText: 'Yanıt gönderilirken hata oluştu',
            ),
            FlutterFlowTheme.of(context).error,
          );
        }
      }
    } else {
      if (mounted) {
        actions.customSnackbar(
          context,
          FFLocalizations.of(context).getVariableText(
            enText: 'Error sending reply',
            arText: 'حدث خطأ أثناء إرسال الرد',
            zh_HansText: '发送回复时出错',
            frText: 'Erreur lors de l\'envoi de la réponse',
            deText: 'Fehler beim Senden der Antwort',
            ptText: 'Erro ao enviar a resposta',
            ruText: 'Ошибка при отправке ответа',
            esText: 'Error al enviar la respuesta',
            trText: 'Yanıt gönderilirken hata oluştu',
          ),
          FlutterFlowTheme.of(context).error,
        );
      }
    }

    if (mounted) {
      setState(() {
        isSendingReply = false;
      });
    }
    return false;
  }

  Future<bool> updateReplies() async {
    if (!mounted) {
      return false;
    }

    final ticketResponse = await FetchSingleTicketDataCall().call(
        id: int.parse(
            getJsonField(widget.ticketDetails, r'''$.id''').toString()));
    if (ticketResponse.succeeded) {
      replies = ticketResponse.jsonBody["data"]["replay"];
      if (mounted) {
        setState(() {});
        return true;
      }
    }

    return false;
  }

  TextEditingController replyController = TextEditingController();

  @override
  void initState() {
    replies = getJsonField(widget.ticketDetails, r'''$.replay''', true);
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    replyController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          await updateReplies();
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                // height: 160.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: const Color.fromARGB(255, 252, 229, 151)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40.0,
                      width: double.infinity,
                      color: const Color(0xFFE4BB31),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              widget.ticketDetails["is_public"] ?? false
                                  ? Icons.public
                                  : Icons.lock,
                              size: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontSize,
                              color: Colors.white,
                            ),
                            gapX(),
                            Text(
                              "${widget.ticketDetails["is_public"] ?? false ? "Public" : "Private"} Ticket #${widget.ticketDetails["ticket_id"]}",
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.white,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                    gapY(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 8.0,
                      ),
                      child: Text(
                        getJsonField(
                          widget.ticketDetails,
                          r'''$.title''',
                        ).toString().trim().toUpperCase().maybeHandleOverflow(
                            maxChars: 20, replacement: "..."),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Nunito Sans',
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w800,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey('Nunito Sans'),
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 8.0,
                      ),
                      child: Text(
                        "Description:",
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey('Nunito Sans'),
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 8.0,
                      ),
                      child: Text(
                        getJsonField(
                          widget.ticketDetails,
                          r'''$.description''',
                        ).toString().trim(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              color: Colors.black,
                              fontSize: 12.0,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey('Nunito Sans'),
                            ),
                      ),
                    ),
                    gapY(),
                    gapY(),
                  ],
                ),
              ),
            ),
            gapY(),
            gapY(),
            FFButtonWidget(
              text: "Details",
              onPressed: () {
                displaybottomsheet(context);
              },
              options: FFButtonOptions(
                width: double.infinity,
                height: 50.0,
                padding:
                    const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: const Color(0xFFE4BB31),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Nunito Sans',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts:
                          GoogleFonts.asMap().containsKey('Nunito Sans'),
                    ),
                elevation: 0.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            gapY(),
            gapY(),
            gapY(),
            Text(
              "conversation".toUpperCase(),
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Nunito Sans',
                    color: Colors.black,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w900,
                    useGoogleFonts:
                        GoogleFonts.asMap().containsKey('Nunito Sans'),
                  ),
            ),
            gapY(),
            gapY(),
            gapY(),
            Expanded(
              child: replies.isEmpty
                  ? Center(
                      child: Text(
                        "Add a reply...",
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Nunito Sans',
                              color: Colors.black54,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey('Nunito Sans'),
                            ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: replies.length,
                      itemBuilder: (context, index) =>
                          Reply(replyData: replies[index]),
                    ),
            ),
            gapY(),
            gapY(),
            TextField(
              maxLines: 2,
              minLines: 1,
              decoration: InputDecoration(
                prefixIcon: InkWell(
                  onLongPress: () {
                    attachments = [];
                    setState(() {});
                  },
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      allowMultiple: true,
                      type: FileType.custom,
                      allowedExtensions: ['jpg', 'pdf', 'doc'],
                    );

                    if (result != null) {
                      attachments += result.files
                          .map((file) {
                            if (file.size <= fileSizeLimitInBytes) {
                              return file;
                            }

                            actions.customSnackbar(
                                context,
                                FFLocalizations.of(context).getVariableText(
                                  enText:
                                      '${file.name} exceeds size limit. Must be < 2MB.',
                                  arText:
                                      'يتجاوز الملف الحد الأقصى للحجم. يجب أن يكون أقل من 2 ميجابايت. ${file.name}',
                                  zh_HansText: '文件超出大小限制。必须小于2MB。${file.name}',
                                  frText:
                                      '${file.name} Le fichier dépasse la limite de taille. Doit être < 2MB.',
                                  deText:
                                      '${file.name} Datei überschreitet die Größenbeschränkung. Muss < 2MB sein.',
                                  ptText:
                                      '${file.name} O arquivo excede o limite de tamanho. Deve ser < 2MB.',
                                  ruText:
                                      '${file.name} Файл превышает допустимый размер. Должен быть < 2MB.',
                                  esText:
                                      '${file.name} El archivo excede el límite de tamaño. Debe ser < 2MB.',
                                  trText:
                                      '${file.name} Dosya boyut sınırını aşıyor. < 2MB olmalıdır.',
                                ),
                                FlutterFlowTheme.of(context).error);
                          })
                          .nonNulls
                          .toList();

                      setState(() {});
                    } else {
                      // User canceled the picker
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: attachments.isEmpty
                        ? Icon(
                            Icons.attach_file,
                            size:
                                FlutterFlowTheme.of(context).bodyLarge.fontSize,
                            color: Colors.grey[600],
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Text(
                              attachments.length.toString(),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: const Color(0xFFE4BB31),
                                    fontSize: 16.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                            ),
                          ),
                  ),
                ),
                suffixIcon: InkWell(
                  onTap: () async {
                    await sendReply(
                      ticketID: getJsonField(widget.ticketDetails, r'''$.id''')
                          .toString(),
                      description: replyController.text,
                      file: "",
                    );
                  },
                  child: isSendingReply
                      ? SizedBox(
                          height:
                              FlutterFlowTheme.of(context).bodyLarge.fontSize,
                          width:
                              FlutterFlowTheme.of(context).bodyLarge.fontSize,
                          child: const Center(
                              child: CircularProgressIndicator.adaptive()),
                        )
                      : Icon(
                          Icons.send_rounded,
                          size: FlutterFlowTheme.of(context).bodyLarge.fontSize,
                          color: const Color(0xFFE4BB31),
                        ),
                ),
                hintText: "Add Ticket Reply",
                hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nunito Sans',
                      color: Colors.black54,
                      useGoogleFonts:
                          GoogleFonts.asMap().containsKey('Nunito Sans'),
                    ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              controller: replyController,
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> displaybottomsheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: const Color.fromARGB(255, 116, 115, 115),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              height: 300,
              width: double.infinity,
              child: widget.ticketDetails.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: EmptyDataComponentWidget(),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      "Status:",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: Colors.black45,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Nunito Sans'),
                                          ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      widget.ticketDetails["status"] == 1
                                          ? widget.ticketDetails["close_at"] !=
                                                  null
                                              ? "Closed"
                                              : "Open"
                                          : "In-progress",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Nunito Sans'),
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      "Customer:",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: Colors.black45,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Nunito Sans'),
                                          ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      widget.customerName.maybeHandleOverflow(
                                          maxChars: 20, replacement: "..."),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Nunito Sans'),
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      "Email:",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: Colors.black45,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Nunito Sans'),
                                          ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      getJsonField(widget.ticketDetails,
                                              r'''$.email''')
                                          .toString()
                                          .trim()
                                          .maybeHandleOverflow(
                                              maxChars: 20, replacement: "..."),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Nunito Sans'),
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      "Category:",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: Colors.black45,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Nunito Sans'),
                                          ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      widget.categoryName.maybeHandleOverflow(
                                          maxChars: 20, replacement: "..."),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Nunito Sans'),
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      "Agents:",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: Colors.black45,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Nunito Sans'),
                                          ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Builder(
                                      builder: ((context) {
                                        List<dynamic> data = getJsonField(
                                          widget.ticketDetails,
                                          r'''$.assign_to''',
                                          true,
                                        );

                                        // data = ["John", "Abraham"];
                                        return data.isNotEmpty
                                            ? ListView.builder(
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) =>
                                                    SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      bottom: 4.0,
                                                    ),
                                                    child: Text(
                                                      data[index]
                                                          .toString()
                                                          .maybeHandleOverflow(
                                                              maxChars: 20,
                                                              replacement:
                                                                  "..."),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: Colors.black,
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
                                                itemCount: data.length,
                                              )
                                            : Text(
                                                "NA",
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      useGoogleFonts:
                                                          GoogleFonts.asMap()
                                                              .containsKey(
                                                                  'Nunito Sans'),
                                                    ),
                                              );
                                      }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      "Created On:",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: Colors.black45,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Nunito Sans'),
                                          ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      formatDateTime(
                                        getJsonField(
                                          widget.ticketDetails,
                                          r'''$.created_at''',
                                        ).toString().trim(),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Nunito Sans'),
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "Attachments:",
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        color: Colors.black45,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Nunito Sans'),
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: List<dynamic>.from(getJsonField(
                                          widget.ticketDetails,
                                          r'''$.media''',
                                          true))
                                      .isNotEmpty
                                  ? Builder(builder: (context) {
                                      List<dynamic> attachments =
                                          List<dynamic>.from(getJsonField(
                                                  widget.ticketDetails,
                                                  r'''$.media''',
                                                  true))
                                              .map((element) => getJsonField(
                                                  element,
                                                  r'''$.original_url'''))
                                              .toList();

                                      return SizedBox(
                                        height: 60.0,
                                        width: double.infinity,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: attachments.length,
                                            itemBuilder: (context, index) =>
                                                Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    showAdaptiveDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return Image.network(
                                                            attachments[index]
                                                                .toString(),
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            fit:
                                                                BoxFit.fitWidth,
                                                            loadingBuilder:
                                                                (context, child,
                                                                    loadingProgress) {
                                                              if (loadingProgress ==
                                                                  null) {
                                                                return child;
                                                              }
                                                              return const Center(
                                                                child:
                                                                    CircularProgressIndicator(),
                                                              );
                                                            },
                                                            errorBuilder:
                                                                (context, error,
                                                                    stackTrace) {
                                                              return Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        10.0),
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Color(
                                                                      0xFFE4BB31),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    const Center(
                                                                        child:
                                                                            Icon(
                                                                  Icons.error,
                                                                  color: Colors
                                                                      .red,
                                                                )),
                                                              );
                                                            },
                                                          );
                                                        });
                                                  },
                                                  child: Image.network(
                                                    attachments[index]
                                                        .toString(),
                                                    height: 50.0,
                                                    // width: 50.0,
                                                    fit: BoxFit.cover,
                                                    loadingBuilder: (context,
                                                        child,
                                                        loadingProgress) {
                                                      if (loadingProgress ==
                                                          null) {
                                                        return child;
                                                      }
                                                      return Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              CircularProgressIndicator(
                                                            value: loadingProgress
                                                                        .expectedTotalBytes !=
                                                                    null
                                                                ? loadingProgress
                                                                        .cumulativeBytesLoaded /
                                                                    loadingProgress
                                                                        .expectedTotalBytes!
                                                                : null,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0xFFE4BB31),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: const Center(
                                                            child: Icon(
                                                          Icons.error,
                                                          color: Colors.red,
                                                        )),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                                  : Builder(builder: (context) {
                                      return Text(
                                        "NA",
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          'Nunito Sans'),
                                            ),
                                      );
                                    }),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          );
        });
  }
}
