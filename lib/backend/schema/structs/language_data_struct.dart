// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LanguageDataStruct extends BaseStruct {
  LanguageDataStruct({
    int? id,
    String? name,
    String? isoCode,
    String? image,
  })  : _id = id,
        _name = name,
        _isoCode = isoCode,
        _image = image;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "iso_code" field.
  String? _isoCode;
  String get isoCode => _isoCode ?? '';
  set isoCode(String? val) => _isoCode = val;
  bool hasIsoCode() => _isoCode != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  static LanguageDataStruct fromMap(Map<String, dynamic> data) =>
      LanguageDataStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        isoCode: data['iso_code'] as String?,
        image: data['image'] as String?,
      );

  static LanguageDataStruct? maybeFromMap(dynamic data) => data is Map
      ? LanguageDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'iso_code': _isoCode,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'iso_code': serializeParam(
          _isoCode,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static LanguageDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      LanguageDataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        isoCode: deserializeParam(
          data['iso_code'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LanguageDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LanguageDataStruct &&
        id == other.id &&
        name == other.name &&
        isoCode == other.isoCode &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, isoCode, image]);
}

LanguageDataStruct createLanguageDataStruct({
  int? id,
  String? name,
  String? isoCode,
  String? image,
}) =>
    LanguageDataStruct(
      id: id,
      name: name,
      isoCode: isoCode,
      image: image,
    );
