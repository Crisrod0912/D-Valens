import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductosRecord extends FirestoreRecord {
  ProductosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "Imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "Precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  bool hasPrecio() => _precio != null;

  // "CategoriaProducto" field.
  DocumentReference? _categoriaProducto;
  DocumentReference? get categoriaProducto => _categoriaProducto;
  bool hasCategoriaProducto() => _categoriaProducto != null;

  // "TiempoEntrega" field.
  String? _tiempoEntrega;
  String get tiempoEntrega => _tiempoEntrega ?? '';
  bool hasTiempoEntrega() => _tiempoEntrega != null;

  // "isProductoDelDia" field.
  bool? _isProductoDelDia;
  bool get isProductoDelDia => _isProductoDelDia ?? false;
  bool hasIsProductoDelDia() => _isProductoDelDia != null;

  // "AddCarrito" field.
  bool? _addCarrito;
  bool get addCarrito => _addCarrito ?? false;
  bool hasAddCarrito() => _addCarrito != null;

  void _initializeFields() {
    _nombre = snapshotData['Nombre'] as String?;
    _imagen = snapshotData['Imagen'] as String?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _precio = castToType<double>(snapshotData['Precio']);
    _categoriaProducto =
        snapshotData['CategoriaProducto'] as DocumentReference?;
    _tiempoEntrega = snapshotData['TiempoEntrega'] as String?;
    _isProductoDelDia = snapshotData['isProductoDelDia'] as bool?;
    _addCarrito = snapshotData['AddCarrito'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('productos');

  static Stream<ProductosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductosRecord.fromSnapshot(s));

  static Future<ProductosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductosRecord.fromSnapshot(s));

  static ProductosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductosRecordData({
  String? nombre,
  String? imagen,
  String? descripcion,
  double? precio,
  DocumentReference? categoriaProducto,
  String? tiempoEntrega,
  bool? isProductoDelDia,
  bool? addCarrito,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nombre': nombre,
      'Imagen': imagen,
      'Descripcion': descripcion,
      'Precio': precio,
      'CategoriaProducto': categoriaProducto,
      'TiempoEntrega': tiempoEntrega,
      'isProductoDelDia': isProductoDelDia,
      'AddCarrito': addCarrito,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductosRecordDocumentEquality implements Equality<ProductosRecord> {
  const ProductosRecordDocumentEquality();

  @override
  bool equals(ProductosRecord? e1, ProductosRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.imagen == e2?.imagen &&
        e1?.descripcion == e2?.descripcion &&
        e1?.precio == e2?.precio &&
        e1?.categoriaProducto == e2?.categoriaProducto &&
        e1?.tiempoEntrega == e2?.tiempoEntrega &&
        e1?.isProductoDelDia == e2?.isProductoDelDia &&
        e1?.addCarrito == e2?.addCarrito;
  }

  @override
  int hash(ProductosRecord? e) => const ListEquality().hash([
        e?.nombre,
        e?.imagen,
        e?.descripcion,
        e?.precio,
        e?.categoriaProducto,
        e?.tiempoEntrega,
        e?.isProductoDelDia,
        e?.addCarrito
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductosRecord;
}
