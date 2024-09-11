import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _selectLanguageIndex =
          prefs.getInt('ff_selectLanguageIndex') ?? _selectLanguageIndex;
    });
    _safeInit(() {
      _authToken = prefs.getString('ff_authToken') ?? _authToken;
    });
    _safeInit(() {
      _email = prefs.getString('ff_email') ?? _email;
    });
    _safeInit(() {
      _role = prefs.getString('ff_role') ?? _role;
    });
    _safeInit(() {
      _isInstructionDialogShow = prefs.getBool('ff_isInstructionDialogShow') ??
          _isInstructionDialogShow;
    });
    _safeInit(() {
      _isPlanExpire = prefs.getBool('ff_isPlanExpire') ?? _isPlanExpire;
    });
    _safeInit(() {
      _isPaymentRequestPending = prefs.getBool('ff_isPaymentRequestPending') ??
          _isPaymentRequestPending;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _selectLanguageIndex = 100;
  int get selectLanguageIndex => _selectLanguageIndex;
  set selectLanguageIndex(int value) {
    _selectLanguageIndex = value;
    prefs.setInt('ff_selectLanguageIndex', value);
  }

  String _selectedDrawerPage = 'Dashboard';
  String get selectedDrawerPage => _selectedDrawerPage;
  set selectedDrawerPage(String value) {
    _selectedDrawerPage = value;
  }

  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
    prefs.setString('ff_authToken', value);
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
    prefs.setString('ff_email', value);
  }

  List<LanguageDataStruct> _languages = [
    LanguageDataStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"0\",\"name\":\"Arabic\",\"iso_code\":\"ar\",\"image\":\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDSl3M4CYdtPe21nVgmJfRGHSbW8we1zm-sg&usqp=CAU\"}')),
    LanguageDataStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"1\",\"name\":\"Chinese (Simplified)\",\"iso_code\":\"zh\",\"image\":\"https://vcards.infyom.com/assets/img/LanguageImage/china.png\"}')),
    LanguageDataStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"2\",\"name\":\"English\",\"iso_code\":\"en\",\"image\":\"https://vcards.infyom.com/assets/img/LanguageImage/english.png\"}')),
    LanguageDataStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"3\",\"name\":\"French\",\"iso_code\":\"fr\",\"image\":\"https://vcards.infyom.com/assets/img/LanguageImage/france.png\"}')),
    LanguageDataStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"4\",\"name\":\"German\",\"iso_code\":\"de\",\"image\":\"https://vcards.infyom.com/assets/img/LanguageImage/german.png\"}')),
    LanguageDataStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"5\",\"name\":\"Portuguese\",\"iso_code\":\"pt\",\"image\":\"https://vcards.infyom.com/assets/img/LanguageImage/portuguese.png\"}')),
    LanguageDataStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"6\",\"name\":\"Russian\",\"iso_code\":\"ru\",\"image\":\"https://vcards.infyom.com/assets/img/LanguageImage/russian.jpeg\"}')),
    LanguageDataStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"7\",\"name\":\"Spanish\",\"iso_code\":\"es\",\"image\":\"https://vcards.infyom.com/assets/img/LanguageImage/spain.png\"}')),
    LanguageDataStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"8\",\"name\":\"Turkish\",\"iso_code\":\"tr\",\"image\":\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjQE-TIhwT4-G04c72eFfn_vV8ZA_U4pKGhg&usqp=CAU\"}'))
  ];
  List<LanguageDataStruct> get languages => _languages;
  set languages(List<LanguageDataStruct> value) {
    _languages = value;
  }

  void addToLanguages(LanguageDataStruct value) {
    _languages.add(value);
  }

  void removeFromLanguages(LanguageDataStruct value) {
    _languages.remove(value);
  }

  void removeAtIndexFromLanguages(int index) {
    _languages.removeAt(index);
  }

  void updateLanguagesAtIndex(
    int index,
    LanguageDataStruct Function(LanguageDataStruct) updateFn,
  ) {
    _languages[index] = updateFn(_languages[index]);
  }

  void insertAtIndexInLanguages(int index, LanguageDataStruct value) {
    _languages.insert(index, value);
  }

  int _selectedGroupIndex = 1000;
  int get selectedGroupIndex => _selectedGroupIndex;
  set selectedGroupIndex(int value) {
    _selectedGroupIndex = value;
  }

  String _scannedURL = '';
  String get scannedURL => _scannedURL;
  set scannedURL(String value) {
    _scannedURL = value;
  }

  String _role = '';
  String get role => _role;
  set role(String value) {
    _role = value;
    prefs.setString('ff_role', value);
  }

  int _selectedBusinessGroupIndex = 0;
  int get selectedBusinessGroupIndex => _selectedBusinessGroupIndex;
  set selectedBusinessGroupIndex(int value) {
    _selectedBusinessGroupIndex = value;
  }

  int _selectedTicketTypeIndex = 0;
  int get selectedTicketTypeIndex => _selectedTicketTypeIndex;
  set selectedTicketTypeIndex(int value) {
    _selectedTicketTypeIndex = value;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
  }

  String _prefixCode = '';
  String get prefixCode => _prefixCode;
  set prefixCode(String value) {
    _prefixCode = value;
  }

  bool _isVcardAppointment = false;
  bool get isVcardAppointment => _isVcardAppointment;
  set isVcardAppointment(bool value) {
    _isVcardAppointment = value;
  }

  bool _isVcardEnquiry = false;
  bool get isVcardEnquiry => _isVcardEnquiry;
  set isVcardEnquiry(bool value) {
    _isVcardEnquiry = value;
  }

  bool _isAPILoading = false;
  bool get isAPILoading => _isAPILoading;
  set isAPILoading(bool value) {
    _isAPILoading = value;
  }

  int _SelectedGroupId = 0;
  int get SelectedGroupId => _SelectedGroupId;
  set SelectedGroupId(int value) {
    _SelectedGroupId = value;
  }

  bool _isInstructionDialogShow = false;
  bool get isInstructionDialogShow => _isInstructionDialogShow;
  set isInstructionDialogShow(bool value) {
    _isInstructionDialogShow = value;
    prefs.setBool('ff_isInstructionDialogShow', value);
  }

  List<dynamic> _businessGroupList = [];
  List<dynamic> get businessGroupList => _businessGroupList;
  set businessGroupList(List<dynamic> value) {
    _businessGroupList = value;
  }

  List<dynamic> _ticketsTypeList = [];
  List<dynamic> get ticketsTypeList => _ticketsTypeList;
  set ticketsTypeList(List<dynamic> value) {
    _ticketsTypeList = value;
  }

  void addToBusinessGroupList(dynamic value) {
    _businessGroupList.add(value);
  }

  void removeFromBusinessGroupList(dynamic value) {
    _businessGroupList.remove(value);
  }

  void removeAtIndexFromBusinessGroupList(int index) {
    _businessGroupList.removeAt(index);
  }

  void updateBusinessGroupListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _businessGroupList[index] = updateFn(_businessGroupList[index]);
  }

  void insertAtIndexInBusinessGroupList(int index, dynamic value) {
    _businessGroupList.insert(index, value);
  }

  List<dynamic> _businessCardList = [];
  List<dynamic> get businessCardList => _businessCardList;
  set businessCardList(List<dynamic> value) {
    _businessCardList = value;
  }

  void addToBusinessCardList(dynamic value) {
    _businessCardList.add(value);
  }

  void removeFromBusinessCardList(dynamic value) {
    _businessCardList.remove(value);
  }

  void removeAtIndexFromBusinessCardList(int index) {
    _businessCardList.removeAt(index);
  }

  void updateBusinessCardListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _businessCardList[index] = updateFn(_businessCardList[index]);
  }

  void insertAtIndexInBusinessCardList(int index, dynamic value) {
    _businessCardList.insert(index, value);
  }

  bool _isBusinessScreenSelected = false;
  bool get isBusinessScreenSelected => _isBusinessScreenSelected;
  set isBusinessScreenSelected(bool value) {
    _isBusinessScreenSelected = value;
  }

  bool _isContactSaving = false;
  bool get isContactSaving => _isContactSaving;
  set isContactSaving(bool value) {
    _isContactSaving = value;
  }

  bool _isPlanExpire = false;
  bool get isPlanExpire => _isPlanExpire;
  set isPlanExpire(bool value) {
    _isPlanExpire = value;
    prefs.setBool('ff_isPlanExpire', value);
  }

  bool _isPaymentRequestPending = false;
  bool get isPaymentRequestPending => _isPaymentRequestPending;
  set isPaymentRequestPending(bool value) {
    _isPaymentRequestPending = value;
    prefs.setBool('ff_isPaymentRequestPending', value);
  }

  String _manualPaymentGuide = '';
  String get manualPaymentGuide => _manualPaymentGuide;
  set manualPaymentGuide(String value) {
    _manualPaymentGuide = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

List<String> getURLCategories() => [
      'Social Media Accounts',
      'Link',
      'WiFi',
      'Email',
      'Geo Location',
      'Launch Application',
      'Custom URL',
    ];
