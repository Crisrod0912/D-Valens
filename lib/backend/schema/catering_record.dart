import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CateringRecord extends FirestoreRecord {
  CateringRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "NumTelefono" field.
  String? _numTelefono;
  String get numTelefono => _numTelefono ?? '';
  bool hasNumTelefono() => _numTelefono != null;

  // "NombCom" field.
  String? _nombCom;
  String get nombCom => _nombCom ?? '';
  bool hasNombCom() => _nombCom != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "cantPer" field.
  int? _cantPer;
  int get cantPer => _cantPer ?? 0;
  bool hasCantPer() => _cantPer != null;

  // "platillo" field.
  String? _platillo;
  String get platillo => _platillo ?? '';
  bool hasPlatillo() => _platillo != null;

  // "direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  void _initializeFields() {
    _numTelefono = snapshotData['NumTelefono'] as String?;
    _nombCom = snapshotData['NombCom'] as String?;
    _email = snapshotData['email'] as String?;
    _cantPer = castToType<int>(snapshotData['cantPer']);
    _platillo = snapshotData['platillo'] as String?;
    _direccion = snapshotData['direccion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Catering');

  static Stream<CateringRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CateringRecord.fromSnapshot(s));

  static Future<CateringRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CateringRecord.fromSnapshot(s));

  static CateringRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CateringRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CateringRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CateringRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CateringRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CateringRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCateringRecordData({
  String? numTelefono,
  String? nombCom,
  String? email,
  int? cantPer,
  String? platillo,
  String? direccion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NumTelefono': numTelefono,
      'NombCom': nombCom,
      'email': email,
      'cantPer': cantPer,
      'platillo': platillo,
      'direccion': direccion,
    }.withoutNulls,
  );

  return firestoreData;
}

class CateringRecordDocumentEquality implements Equality<CateringRecord> {
  const CateringRecordDocumentEquality();

  @override
  bool equals(CateringRecord? e1, CateringRecord? e2) {
    return e1?.numTelefono == e2?.numTelefono &&
        e1?.nombCom == e2?.nombCom &&
        e1?.email == e2?.email &&
        e1?.cantPer == e2?.cantPer &&
        e1?.platillo == e2?.platillo &&
        e1?.direccion == e2?.direccion;
  }

  @override
  int hash(CateringRecord? e) => const ListEquality().hash([
        e?.numTelefono,
        e?.nombCom,
        e?.email,
        e?.cantPer,
        e?.platillo,
        e?.direccion
      ]);

  @override
  bool isValidKey(Object? o) => o is CateringRecord;
}
