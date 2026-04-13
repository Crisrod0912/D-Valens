// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatStruct extends FFFirebaseStruct {
  ChatStruct({
    String? mensajes,
    Role? rol,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mensajes = mensajes,
        _rol = rol,
        super(firestoreUtilData);

  // "mensajes" field.
  String? _mensajes;
  String get mensajes => _mensajes ?? '';
  set mensajes(String? val) => _mensajes = val;

  bool hasMensajes() => _mensajes != null;

  // "rol" field.
  Role? _rol;
  Role? get rol => _rol;
  set rol(Role? val) => _rol = val;

  bool hasRol() => _rol != null;

  static ChatStruct fromMap(Map<String, dynamic> data) => ChatStruct(
        mensajes: data['mensajes'] as String?,
        rol: data['rol'] is Role
            ? data['rol']
            : deserializeEnum<Role>(data['rol']),
      );

  static ChatStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChatStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'mensajes': _mensajes,
        'rol': _rol?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mensajes': serializeParam(
          _mensajes,
          ParamType.String,
        ),
        'rol': serializeParam(
          _rol,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static ChatStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatStruct(
        mensajes: deserializeParam(
          data['mensajes'],
          ParamType.String,
          false,
        ),
        rol: deserializeParam<Role>(
          data['rol'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'ChatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatStruct &&
        mensajes == other.mensajes &&
        rol == other.rol;
  }

  @override
  int get hashCode => const ListEquality().hash([mensajes, rol]);
}

ChatStruct createChatStruct({
  String? mensajes,
  Role? rol,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatStruct(
      mensajes: mensajes,
      rol: rol,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatStruct? updateChatStruct(
  ChatStruct? chat, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chat
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatStructData(
  Map<String, dynamic> firestoreData,
  ChatStruct? chat,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chat == null) {
    return;
  }
  if (chat.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && chat.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatData = getChatFirestoreData(chat, forFieldValue);
  final nestedData = chatData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chat.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatFirestoreData(
  ChatStruct? chat, [
  bool forFieldValue = false,
]) {
  if (chat == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chat.toMap());

  // Add any Firestore field values
  mapToFirestore(chat.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatListFirestoreData(
  List<ChatStruct>? chats,
) =>
    chats?.map((e) => getChatFirestoreData(e, true)).toList() ?? [];
