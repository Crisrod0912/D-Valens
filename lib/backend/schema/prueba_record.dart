import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PruebaRecord extends FirestoreRecord {
  PruebaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "prueba" field.
  String? _prueba;
  String get prueba => _prueba ?? '';
  bool hasPrueba() => _prueba != null;

  void _initializeFields() {
    _prueba = snapshotData['prueba'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('prueba');

  static Stream<PruebaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PruebaRecord.fromSnapshot(s));

  static Future<PruebaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PruebaRecord.fromSnapshot(s));

  static PruebaRecord fromSnapshot(DocumentSnapshot snapshot) => PruebaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PruebaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PruebaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PruebaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PruebaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPruebaRecordData({
  String? prueba,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'prueba': prueba,
    }.withoutNulls,
  );

  return firestoreData;
}

class PruebaRecordDocumentEquality implements Equality<PruebaRecord> {
  const PruebaRecordDocumentEquality();

  @override
  bool equals(PruebaRecord? e1, PruebaRecord? e2) {
    return e1?.prueba == e2?.prueba;
  }

  @override
  int hash(PruebaRecord? e) => const ListEquality().hash([e?.prueba]);

  @override
  bool isValidKey(Object? o) => o is PruebaRecord;
}
