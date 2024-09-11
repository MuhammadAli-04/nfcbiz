import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Vcard Group Code

class VcardGroup {
  static String baseUrl = 'https://dashboard.nfcbiz.com/api';
  static Map<String, String> headers = {};
  static LoginCall loginCall = LoginCall();
  static LogoutCall logoutCall = LogoutCall();
  static SuperDashboardCall superDashboardCall = SuperDashboardCall();
  static AdminVcardCall adminVcardCall = AdminVcardCall();
  static VcardsCall vcardsCall = VcardsCall();
  static AppointmentCall appointmentCall = AppointmentCall();
  static SingleAppointmentCall singleAppointmentCall = SingleAppointmentCall();
  static SettingsCall settingsCall = SettingsCall();
  static DeleteAppointmentCall deleteAppointmentCall = DeleteAppointmentCall();
  static EnquiryCall enquiryCall = EnquiryCall();
  static SingleEnquiryCall singleEnquiryCall = SingleEnquiryCall();
  static DeleteEnquiryCall deleteEnquiryCall = DeleteEnquiryCall();
  static ProfileCall profileCall = ProfileCall();
  static SingleVcardsCall singleVcardsCall = SingleVcardsCall();
  static DeleteVcardCall deleteVcardCall = DeleteVcardCall();
  static RegisterCall registerCall = RegisterCall();
  static GroupCreateCall groupCreateCall = GroupCreateCall();
  static GroupsCall groupsCall = GroupsCall();
  static AdminGroupCall adminGroupCall = AdminGroupCall();
  static ChangePasswordCall changePasswordCall = ChangePasswordCall();
  static LanguageUpdateCall languageUpdateCall = LanguageUpdateCall();
  static BusinessCardCreateCall businessCardCreateCall =
      BusinessCardCreateCall();
  static AdminDashboardCall adminDashboardCall = AdminDashboardCall();
  static BusinessCardCall businessCardCall = BusinessCardCall();
  static AdminBusinessCardCall adminBusinessCardCall = AdminBusinessCardCall();
  static FilterBusinessCardCall filterBusinessCardCall =
      FilterBusinessCardCall();
  static SettingUpdateCall settingUpdateCall = SettingUpdateCall();
  static AdminIncomeChartCall adminIncomeChartCall = AdminIncomeChartCall();
  static SuperAdminIncomeChartCall superAdminIncomeChartCall =
      SuperAdminIncomeChartCall();
  static TodayAppointmentCall todayAppointmentCall = TodayAppointmentCall();
  static VcardAppointmentCall vcardAppointmentCall = VcardAppointmentCall();
  static VcardEnquiryCall vcardEnquiryCall = VcardEnquiryCall();
  static AppointmentCompletedCall appointmentCompletedCall =
      AppointmentCompletedCall();
  static ProfileUpdateCall profileUpdateCall = ProfileUpdateCall();
  static VcardQrCodeCall vcardQrCodeCall = VcardQrCodeCall();
  static LanguageCall languageCall = LanguageCall();
  static DeleteGroupCall deleteGroupCall = DeleteGroupCall();
  static ForgotPasswordCall forgotPasswordCall = ForgotPasswordCall();
  static ResetPasswordCall resetPasswordCall = ResetPasswordCall();
  static AdminGroupCreateCall adminGroupCreateCall = AdminGroupCreateCall();
  static SubscriptionPlanCall subscriptionPlanCall = SubscriptionPlanCall();
  static UpdateProfileCall updateProfileCall = UpdateProfileCall();
  static SubscriptionPlanBuyCall subscriptionPlanBuyCall =
      SubscriptionPlanBuyCall();
  static PaymentRequestStatusCall paymentRequestStatusCall =
      PaymentRequestStatusCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${VcardGroup.baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Logout',
      apiUrl: '${VcardGroup.baseUrl}/logout',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SuperDashboardCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Super Dashboard',
      apiUrl: '${VcardGroup.baseUrl}/dashboard',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AdminVcardCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Admin Vcard',
      apiUrl: '${VcardGroup.baseUrl}/admin/vcard',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class VcardsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Vcards',
      apiUrl: '${VcardGroup.baseUrl}/vcard',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class AppointmentCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Appointment',
      apiUrl: '${VcardGroup.baseUrl}/admin/appointment',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class SingleAppointmentCall {
  Future<ApiCallResponse> call({
    int? id,
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Single Appointment',
      apiUrl: '${VcardGroup.baseUrl}/admin/appointment/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].name''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].email''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].phone''',
      ));
  String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].date''',
      ));
  String? from(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].from_time''',
      ));
  String? to(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].to_time''',
      ));
  int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].status''',
      ));
  String? paidamount(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].paid_amount''',
      ));
  String? vcardName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].vcard_name''',
      ));
}

class SettingsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Settings',
      apiUrl: '${VcardGroup.baseUrl}/admin/settings-edit',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? language(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].language''',
      ));
  String? time(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].time_format''',
      ));
  String? enableAffiliation(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].enable_affiliation''',
      ));
  String? enableContact(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].enable_contact''',
      ));
  String? hideStickybar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].hide_stickybar''',
      ));
  String? whatsappShare(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].whatsapp_share''',
      ));
}

class DeleteAppointmentCall {
  Future<ApiCallResponse> call({
    int? id,
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Appointment',
      apiUrl: '${VcardGroup.baseUrl}/admin/appointment-delete/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class EnquiryCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Enquiry',
      apiUrl: '${VcardGroup.baseUrl}/admin/enquiries',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class SingleEnquiryCall {
  Future<ApiCallResponse> call({
    int? id,
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Single Enquiry',
      apiUrl: '${VcardGroup.baseUrl}/admin/enquiries/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].id''',
      ));
  String? vcardName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].vcard_name''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].name''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].email''',
      ));
  int? phone(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].phone''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].message''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].created_at''',
      ));
}

class DeleteEnquiryCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Enquiry',
      apiUrl: '${VcardGroup.baseUrl}/admin/enquiries-delete/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class ProfileCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Profile',
      apiUrl: '${VcardGroup.baseUrl}/profile-edit',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].first_name''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].last_name''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].email''',
      ));
  String? contact(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].contact''',
      ));
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].profile_image''',
      ));
  String? language(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].language''',
      ));
  String? regionCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].region_code''',
      ));
  String? manualPaymentGuide(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].manual_payment_guide''',
      ));
}

class SingleVcardsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Single Vcards',
      apiUrl: '${VcardGroup.baseUrl}/vcard/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].name''',
      ));
  String? occupation(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].occupation''',
      ));
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].image''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].created_at''',
      ));
}

class DeleteVcardCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Vcard',
      apiUrl: '${VcardGroup.baseUrl}/admin/vcard-delete/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class RegisterCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "first_name": "$firstName",
  "last_name": "$lastName",
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register',
      apiUrl: '${VcardGroup.baseUrl}/register',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class GroupCreateCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? name = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "$name"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Group Create',
      apiUrl: '${VcardGroup.baseUrl}/groups-create',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GroupsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Groups',
      apiUrl: '${VcardGroup.baseUrl}/groups',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class AdminGroupCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Admin Group',
      apiUrl: '${VcardGroup.baseUrl}/admin/groups',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class ChangePasswordCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? email = '',
    String? oldPassword = '',
    String? newPassword = '',
    String? confirmPassword = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "old_password": "$oldPassword",
  "password": "$newPassword",
  "password_conformation": "$confirmPassword"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Change Password',
      apiUrl: '${VcardGroup.baseUrl}/reset-password',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class LanguageUpdateCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? language = '',
  }) async {
    final ffApiRequestBody = '''
{
  "language": "$language"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Language Update',
      apiUrl: '${VcardGroup.baseUrl}/language-update',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class BusinessCardCreateCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? urlAlias = '',
    String? groupId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "url_alias": "$urlAlias",
  "group_id": "$groupId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Business Card Create',
      apiUrl: '${VcardGroup.baseUrl}/business-cards-create',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AdminDashboardCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Admin Dashboard',
      apiUrl: '${VcardGroup.baseUrl}/admin/dashboard',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BusinessCardCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Business Card',
      apiUrl: '${VcardGroup.baseUrl}/business-cards',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class AdminBusinessCardCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Admin Business Card',
      apiUrl: '${VcardGroup.baseUrl}/admin/business-cards',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class FilterBusinessCardCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? filter,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Filter Business Card',
      apiUrl: '${VcardGroup.baseUrl}/business-cards',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'filter[]': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class SettingUpdateCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? enableAffiliation = '',
    String? enableContact = '',
    String? hideStickybar = '',
    String? whatsappShare = '',
    String? timeFormat = '',
  }) async {
    final ffApiRequestBody = '''
{
  "time_format": "$timeFormat",
  "enable_affiliation": "$enableAffiliation",
  "enable_contact": "$enableContact",
  "hide_stickybar": "$hideStickybar",
  "whatsapp_share": "$whatsappShare"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Setting Update',
      apiUrl: '${VcardGroup.baseUrl}/admin/settings-update',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AdminIncomeChartCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Admin Income Chart',
      apiUrl: '${VcardGroup.baseUrl}/admin/income-chart',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? weeklyLabel(dynamic response) => (getJsonField(
        response,
        r'''$.data.weeklyLabels''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data.data''',
        true,
      ) as List?;
}

class SuperAdminIncomeChartCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Super Admin Income Chart ',
      apiUrl: '${VcardGroup.baseUrl}/income-chart',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class TodayAppointmentCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Today Appointment',
      apiUrl: '${VcardGroup.baseUrl}/admin/today-appointment',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class VcardAppointmentCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Vcard Appointment',
      apiUrl: '${VcardGroup.baseUrl}/admin/vcard-appointment/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class VcardEnquiryCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Vcard Enquiry',
      apiUrl: '${VcardGroup.baseUrl}/admin/vcard-enquires/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class AppointmentCompletedCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? id,
    int? status,
  }) async {
    final ffApiRequestBody = '''
{
  "status": $status
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Appointment Completed',
      apiUrl: '${VcardGroup.baseUrl}/admin/appointment-completed/$id',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ProfileUpdateCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? contact = '',
    String? regionCode = '',
    String? email = '',
    FFUploadedFile? profile,
    String? authToken = '',
    String? manualPaymentGuide = '',
    String? lastName = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Profile Update',
      apiUrl: '${VcardGroup.baseUrl}/profile-update',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'first_name': firstName,
        'contact': contact,
        'region_code': regionCode,
        'email': email,
        'profile': profile,
        'manual_payment_guide': manualPaymentGuide,
        'last_name': lastName,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class VcardQrCodeCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Vcard Qr code',
      apiUrl: '${VcardGroup.baseUrl}/vcard-qrcode/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].url''',
      ));
}

class LanguageCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Language',
      apiUrl: '${VcardGroup.baseUrl}/language-edit',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class DeleteGroupCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Group',
      apiUrl: '${VcardGroup.baseUrl}/group-delete/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ForgotPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? urlDomain = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "url_domain": "$urlDomain"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Forgot Password',
      apiUrl: '${VcardGroup.baseUrl}/forgot-password',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ResetPasswordCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? email = '',
    String? password = '',
    String? confirmPassword = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Reset Password',
      apiUrl:
          '${VcardGroup.baseUrl}/password?token=$token&email=$email&password=$password&password_confirmation=$confirmPassword',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AdminGroupCreateCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? name = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Admin Group Create',
      apiUrl: '${VcardGroup.baseUrl}/admin/groups-create?name=$name',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SubscriptionPlanCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Subscription plan',
      apiUrl: '${VcardGroup.baseUrl}/admin/subscription-plan',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class UpdateProfileCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? firstName = '',
    String? contact = '',
    String? regionCode = '',
    String? email = '',
    FFUploadedFile? profile,
    String? manualPaymentGuide = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'update profile',
      apiUrl: '${VcardGroup.baseUrl}/profile-update',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'first_name': firstName,
        'contact': contact,
        'region_code': regionCode,
        'email': email,
        'profile': profile,
        'manual_payment_guide': manualPaymentGuide,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SubscriptionPlanBuyCall {
  Future<ApiCallResponse> call({
    int? id,
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Subscription plan buy',
      apiUrl: '${VcardGroup.baseUrl}/admin/plans-buy/$id',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class PaymentRequestStatusCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Payment Request Status',
      apiUrl: '${VcardGroup.baseUrl}/admin/payment-is-pending',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data''',
      ));
}

/// End Vcard Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}

// ticket system APIs

const ticketSystemBaseURL = "https://support.nfcbiz.com/api";

class FetchTicketsCall {
  Future<ApiCallResponse> call({
    String page = "1",
  }) async {
    String email = FFAppState().email;
    return ApiManager.instance.makeApiCall(
      apiUrl: "$ticketSystemBaseURL/tickets",
      callName: "Fetch Tickets",
      callType: ApiCallType.GET,
      returnBody: true,
      params: {
        "email": email,
        "page": page,
      },
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data''',
      ));
}

class FetchSingleTicketDataCall {
  Future<ApiCallResponse> call({
    required int id,
  }) async {
    return ApiManager.instance.makeApiCall(
      apiUrl: "$ticketSystemBaseURL/tickets/$id",
      callName: "Fetch Single Ticket Data",
      callType: ApiCallType.GET,
      returnBody: true,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data''',
      ));
}

class AddReplyCall {
  Future<ApiCallResponse> call({
    required String ticketID,
    required String description,
    required List<File> files,
  }) async {
    const String url = '$ticketSystemBaseURL/add-reply';
    String email = FFAppState().email;

    List<http.MultipartFile> multipartFiles =
        await Future.wait(files.map((attachment) async {
      var stream = http.ByteStream(attachment.openRead());
      stream.cast();
      return http.MultipartFile(
        "file[]",
        stream,
        await attachment.length(),
        filename: basename(attachment.path),
      );
    }));

    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields['email'] = email
      ..fields['ticket_id'] = ticketID
      ..fields['description'] = description;
    request.files.addAll(multipartFiles);
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    return ApiCallResponse.fromHttpResponse(response, true, false);
  }
}

class FetchCreateTicketDataCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      apiUrl: "$ticketSystemBaseURL/ticket/create",
      callName: "Fetch Create Ticket Data",
      callType: ApiCallType.GET,
      returnBody: true,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data''',
      ));
}

class CreateTicketCall {
  Future<ApiCallResponse> call({
    required String title,
    required String description,
    required String categoryID,
    required String isPublic,
    required List<File> attachments,
  }) async {
    const String url = '$ticketSystemBaseURL/ticket';

    List<http.MultipartFile> multipartFiles =
        await Future.wait(attachments.map((attachment) async {
      var stream = http.ByteStream(attachment.openRead());
      stream.cast();
      return http.MultipartFile(
        "attachments[]",
        stream,
        await attachment.length(),
        filename: basename(attachment.path),
      );
    }));

    String email = FFAppState().email;

    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields['email'] = email
      ..fields['title'] = title
      ..fields['description'] = description
      ..fields['category_id'] = categoryID
      ..fields['is_public'] = isPublic;
    request.files.addAll(multipartFiles);
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    return ApiCallResponse.fromHttpResponse(response, true, false);
  }
}
