import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfc_biz/backend/api_requests/api_calls.dart';
import 'package:nfc_biz/backend/api_requests/api_manager.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';

import 'create_ticket_screen_model.dart';
export 'create_ticket_screen_model.dart';
import 'package:nfc_biz/component/file_button/file_button.dart';
import 'package:nfc_biz/flutter_flow/flutter_flow_widgets.dart';
import '/component/drawer/drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;

class CreateTicketScreenWidget extends StatefulWidget {
  const CreateTicketScreenWidget({super.key});

  @override
  State<CreateTicketScreenWidget> createState() =>
      _CreateTicketScreenWidgetState();
}

final Map<String, String> ticketType = {
  '0': "Private",
};

class _CreateTicketScreenWidgetState extends State<CreateTicketScreenWidget> {
  int fileSizeLimitInBytes = 2097152;

  late CreateTicketScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String? selectedCategory;
  String? selectedType;

  Map<String, dynamic> ticketCategories = {};

  List<PlatformFile> attachments = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateTicketScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (mounted) {
        setState(() {
          FFAppState().isAPILoading = true;
        });
      }

      // add precautionary measures
      ApiCallResponse response = await FetchCreateTicketDataCall().call();
      if (response.succeeded) {
        ticketCategories =
            getJsonField(response.jsonBody, r'''$.data.categories''');
      } else {
        if (mounted) {
          await actions.customSnackbar(
              context,
              FFLocalizations.of(context).getVariableText(
                enText: 'Error fetching data necessary for creating ticket.',
                arText: 'خطأ في جلب البيانات اللازمة لإنشاء التذكرة.',
                zh_HansText: '获取创建票据所需数据时出错。',
                frText:
                    'Erreur lors de la récupération des données nécessaires à la création du billet.',
                deText:
                    'Fehler beim Abrufen der für die Ticketerstellung erforderlichen Daten.',
                ptText:
                    'Erro ao buscar os dados necessários para criar o bilhete.',
                ruText:
                    'Ошибка при получении данных, необходимых для создания билета.',
                esText:
                    'Error al obtener los datos necesarios para crear el ticket.',
                trText:
                    'Bilet oluşturmak için gerekli veriler alınırken hata oluştu.',
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

  bool validateForm() {
    return selectedCategory != null &&
        selectedCategory!.isNotEmpty &&
        selectedType != null &&
        selectedType!.isNotEmpty &&
        titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty;
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
              'a1b2c3d4' /* Tickets */,
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
              return SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.88,
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16.0,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextField(
                            cursorColor: const Color(0xFFE4BB31),
                            decoration: InputDecoration(
                              labelText: "Ticket Title",
                              hintStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.black54,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.black54,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Color(0xFFE4BB31),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Color(0xFFE4BB31),
                                ),
                              ),
                            ),
                            controller: titleController,
                          ),
                          gapY(),
                          gapY(),
                          gapY(),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: DropdownButton<String>(
                                isExpanded: true,
                                value: selectedCategory,
                                underline: Container(),
                                onChanged: (String? newValue) {
                                  if (newValue == null) {
                                    return;
                                  }
                                  setState(() {
                                    selectedCategory = newValue;
                                  });
                                },
                                hint: Text(
                                  "Ticket Category",
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        color: Colors.black54,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Nunito Sans'),
                                      ),
                                ),
                                items: ticketCategories.entries
                                    .map(
                                      (item) => DropdownMenuItem<String>(
                                          value: item.key,
                                          child: Text(item.value.toString())),
                                    )
                                    .toList()),
                          ),
                          gapY(),
                          gapY(),
                          gapY(),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: selectedType,
                              underline: Container(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedType = newValue;
                                });
                              },
                              hint: Text(
                                "Ticket Type",
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: Colors.black54,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Nunito Sans'),
                                    ),
                              ),
                              items: ticketType.entries
                                  .map(
                                    (item) => DropdownMenuItem<String>(
                                      value: item.key,
                                      child: Text(
                                        item.value.toString(),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          gapY(),
                          gapY(),
                          gapY(),
                          TextField(
                            minLines: 3,
                            maxLines: 3,
                            cursorColor: const Color(0xFFE4BB31),
                            decoration: InputDecoration(
                              labelText: "Ticket Description",
                              hintStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.black54,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.black54,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nunito Sans'),
                                  ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Color(0xFFE4BB31),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Color(0xFFE4BB31),
                                ),
                              ),
                            ),
                            controller: descriptionController,
                          ),
                          gapY(),
                          gapY(),
                          gapY(),
                          Expanded(
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0x1AE4BB31),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: const Color(0xFFE4BB31),
                                    ),
                                  ),
                                  child: attachments.isEmpty
                                      ? Center(
                                          child: Text(
                                            "Add Attachments",
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  color: Colors.black54,
                                                  useGoogleFonts:
                                                      GoogleFonts.asMap()
                                                          .containsKey(
                                                              'Nunito Sans'),
                                                ),
                                          ),
                                        )
                                      : ListView.builder(
                                          itemCount: attachments.length,
                                          itemBuilder: ((context, index) =>
                                              FileButton(
                                                fileName:
                                                    attachments[index].name,
                                                onPressed: (filename) {
                                                  attachments.removeWhere(
                                                      (file) =>
                                                          file.name ==
                                                          filename);
                                                  setState(() {});
                                                },
                                              )),
                                        ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FloatingActionButton(
                                    backgroundColor: const Color(0xFFE4BB31),
                                    onPressed: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles(
                                        allowMultiple: true,
                                        type: FileType.custom,
                                        allowedExtensions: [
                                          'jpg',
                                          'pdf',
                                          'doc'
                                        ],
                                      );

                                      if (result != null) {
                                        attachments += result.files
                                            .map((file) {
                                              if (file.size <=
                                                  fileSizeLimitInBytes) {
                                                return file;
                                              }

                                              actions.customSnackbar(
                                                  context,
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                    enText:
                                                        '${file.name} exceeds size limit. Must be < 2MB.',
                                                    arText:
                                                        'يتجاوز الملف الحد الأقصى للحجم. يجب أن يكون أقل من 2 ميجابايت. ${file.name}',
                                                    zh_HansText:
                                                        '文件超出大小限制。必须小于2MB。${file.name}',
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
                                                  FlutterFlowTheme.of(context)
                                                      .error);
                                            })
                                            .nonNulls
                                            .toList();

                                        setState(() {});
                                      } else {
                                        // User canceled the picker
                                      }
                                    },
                                    child: const Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          gapY(),
                          gapY(),
                          gapY(),
                          FFButtonWidget(
                            text: "Create Ticket",
                            onPressed: () async {
                              if (!validateForm()) {
                                await actions.customSnackbar(
                                    context,
                                    FFLocalizations.of(context).getVariableText(
                                      enText: 'Please fill all the fields.',
                                      arText: 'يرجى ملء جميع الحقول.',
                                      zh_HansText: '请填写所有字段。',
                                      frText:
                                          'Veuillez remplir tous les champs.',
                                      deText:
                                          'Bitte füllen Sie alle Felder aus.',
                                      ptText:
                                          'Por favor, preencha todos os campos.',
                                      ruText: 'Пожалуйста, заполните все поля.',
                                      esText:
                                          'Por favor, rellena todos los campos.',
                                      trText: 'Lütfen tüm alanları doldurun.',
                                    ),
                                    FlutterFlowTheme.of(context).error);
                                return;
                              }

                              final ApiCallResponse response =
                                  await CreateTicketCall().call(
                                // email: "test@vcard.com",
                                title: titleController.text,
                                description: descriptionController.text,
                                categoryID: selectedCategory!,
                                isPublic: (selectedType! == '1').toString(),
                                attachments: attachments
                                    .map((attachment) => File(attachment.path!))
                                    .toList(),
                              );

                              if (response.succeeded) {
                                if (mounted) {
                                  await actions.customSnackbar(
                                      context,
                                      FFLocalizations.of(context)
                                          .getVariableText(
                                        enText: 'Ticket created successfully.',
                                        arText: 'تم إنشاء التذكرة بنجاح.',
                                        zh_HansText: '票据创建成功。',
                                        frText: 'Billet créé avec succès.',
                                        deText: 'Ticket erfolgreich erstellt.',
                                        ptText: 'Bilhete criado com sucesso.',
                                        ruText: 'Билет успешно создан.',
                                        esText: 'Ticket creado con éxito.',
                                        trText: 'Bilet başarıyla oluşturuldu.',
                                      ),
                                      const Color(0xFFE4BB31));

                                  context.safePop();
                                }
                              } else {
                                if (mounted) {
                                  await actions.customSnackbar(
                                      context,
                                      FFLocalizations.of(context)
                                          .getVariableText(
                                        enText:
                                            'Error creating new ticket. Try again.',
                                        arText:
                                            'حدث خطأ أثناء إنشاء تذكرة جديدة. حاول مرة أخرى.',
                                        zh_HansText: '创建新票据时出错。请再试一次。',
                                        frText:
                                            'Erreur lors de la création du nouveau billet. Réessayez.',
                                        deText:
                                            'Fehler beim Erstellen eines neuen Tickets. Versuchen Sie es erneut.',
                                        ptText:
                                            'Erro ao criar novo bilhete. Tente novamente.',
                                        ruText:
                                            'Ошибка при создании нового билета. Попробуйте еще раз.',
                                        esText:
                                            'Error al crear un nuevo ticket. Inténtalo de nuevo.',
                                        trText:
                                            'Yeni bilet oluşturulurken hata oluştu. Tekrar deneyin.',
                                      ),
                                      FlutterFlowTheme.of(context).error);
                                }
                              }
                            },
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
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
                          )
                        ],
                      ),
                    ),
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
