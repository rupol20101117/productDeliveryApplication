import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "productref" field.
  List<DocumentReference>? _productref;
  List<DocumentReference> get productref => _productref ?? const [];
  bool hasProductref() => _productref != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "number_of_items_in_cart" field.
  int? _numberOfItemsInCart;
  int get numberOfItemsInCart => _numberOfItemsInCart ?? 0;
  bool hasNumberOfItemsInCart() => _numberOfItemsInCart != null;

  // "total_price" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _productref = getDataList(snapshotData['productref']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _numberOfItemsInCart =
        castToType<int>(snapshotData['number_of_items_in_cart']);
    _totalPrice = castToType<double>(snapshotData['total_price']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('orders')
          : FirebaseFirestore.instance.collectionGroup('orders');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('orders').doc();

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  DateTime? timestamp,
  String? status,
  int? numberOfItemsInCart,
  double? totalPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timestamp': timestamp,
      'status': status,
      'number_of_items_in_cart': numberOfItemsInCart,
      'total_price': totalPrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.productref, e2?.productref) &&
        e1?.timestamp == e2?.timestamp &&
        e1?.status == e2?.status &&
        e1?.numberOfItemsInCart == e2?.numberOfItemsInCart &&
        e1?.totalPrice == e2?.totalPrice;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.productref,
        e?.timestamp,
        e?.status,
        e?.numberOfItemsInCart,
        e?.totalPrice
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
