import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrackOrderRecord extends FirestoreRecord {
  TrackOrderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "order_placed" field.
  bool? _orderPlaced;
  bool get orderPlaced => _orderPlaced ?? false;
  bool hasOrderPlaced() => _orderPlaced != null;

  // "order_placed_timestamp" field.
  DateTime? _orderPlacedTimestamp;
  DateTime? get orderPlacedTimestamp => _orderPlacedTimestamp;
  bool hasOrderPlacedTimestamp() => _orderPlacedTimestamp != null;

  // "order_inprogress" field.
  bool? _orderInprogress;
  bool get orderInprogress => _orderInprogress ?? false;
  bool hasOrderInprogress() => _orderInprogress != null;

  // "order_inprogress_timestamp" field.
  DateTime? _orderInprogressTimestamp;
  DateTime? get orderInprogressTimestamp => _orderInprogressTimestamp;
  bool hasOrderInprogressTimestamp() => _orderInprogressTimestamp != null;

  // "order_shipped" field.
  bool? _orderShipped;
  bool get orderShipped => _orderShipped ?? false;
  bool hasOrderShipped() => _orderShipped != null;

  // "order_shipped_timestamp" field.
  DateTime? _orderShippedTimestamp;
  DateTime? get orderShippedTimestamp => _orderShippedTimestamp;
  bool hasOrderShippedTimestamp() => _orderShippedTimestamp != null;

  // "order_delivery" field.
  bool? _orderDelivery;
  bool get orderDelivery => _orderDelivery ?? false;
  bool hasOrderDelivery() => _orderDelivery != null;

  // "order_delivery_timestamp" field.
  DateTime? _orderDeliveryTimestamp;
  DateTime? get orderDeliveryTimestamp => _orderDeliveryTimestamp;
  bool hasOrderDeliveryTimestamp() => _orderDeliveryTimestamp != null;

  void _initializeFields() {
    _orderPlaced = snapshotData['order_placed'] as bool?;
    _orderPlacedTimestamp = snapshotData['order_placed_timestamp'] as DateTime?;
    _orderInprogress = snapshotData['order_inprogress'] as bool?;
    _orderInprogressTimestamp =
        snapshotData['order_inprogress_timestamp'] as DateTime?;
    _orderShipped = snapshotData['order_shipped'] as bool?;
    _orderShippedTimestamp =
        snapshotData['order_shipped_timestamp'] as DateTime?;
    _orderDelivery = snapshotData['order_delivery'] as bool?;
    _orderDeliveryTimestamp =
        snapshotData['order_delivery_timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('track_order');

  static Stream<TrackOrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TrackOrderRecord.fromSnapshot(s));

  static Future<TrackOrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TrackOrderRecord.fromSnapshot(s));

  static TrackOrderRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TrackOrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TrackOrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TrackOrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TrackOrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TrackOrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTrackOrderRecordData({
  bool? orderPlaced,
  DateTime? orderPlacedTimestamp,
  bool? orderInprogress,
  DateTime? orderInprogressTimestamp,
  bool? orderShipped,
  DateTime? orderShippedTimestamp,
  bool? orderDelivery,
  DateTime? orderDeliveryTimestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'order_placed': orderPlaced,
      'order_placed_timestamp': orderPlacedTimestamp,
      'order_inprogress': orderInprogress,
      'order_inprogress_timestamp': orderInprogressTimestamp,
      'order_shipped': orderShipped,
      'order_shipped_timestamp': orderShippedTimestamp,
      'order_delivery': orderDelivery,
      'order_delivery_timestamp': orderDeliveryTimestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class TrackOrderRecordDocumentEquality implements Equality<TrackOrderRecord> {
  const TrackOrderRecordDocumentEquality();

  @override
  bool equals(TrackOrderRecord? e1, TrackOrderRecord? e2) {
    return e1?.orderPlaced == e2?.orderPlaced &&
        e1?.orderPlacedTimestamp == e2?.orderPlacedTimestamp &&
        e1?.orderInprogress == e2?.orderInprogress &&
        e1?.orderInprogressTimestamp == e2?.orderInprogressTimestamp &&
        e1?.orderShipped == e2?.orderShipped &&
        e1?.orderShippedTimestamp == e2?.orderShippedTimestamp &&
        e1?.orderDelivery == e2?.orderDelivery &&
        e1?.orderDeliveryTimestamp == e2?.orderDeliveryTimestamp;
  }

  @override
  int hash(TrackOrderRecord? e) => const ListEquality().hash([
        e?.orderPlaced,
        e?.orderPlacedTimestamp,
        e?.orderInprogress,
        e?.orderInprogressTimestamp,
        e?.orderShipped,
        e?.orderShippedTimestamp,
        e?.orderDelivery,
        e?.orderDeliveryTimestamp
      ]);

  @override
  bool isValidKey(Object? o) => o is TrackOrderRecord;
}
