import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubcollectionRecord extends FirestoreRecord {
  SubcollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "desription" field.
  String? _desription;
  String get desription => _desription ?? '';
  bool hasDesription() => _desription != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "refer" field.
  List<DocumentReference>? _refer;
  List<DocumentReference> get refer => _refer ?? const [];
  bool hasRefer() => _refer != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _desription = snapshotData['desription'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _refer = getDataList(snapshotData['refer']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('subcollection')
          : FirebaseFirestore.instance.collectionGroup('subcollection');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('subcollection').doc();

  static Stream<SubcollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubcollectionRecord.fromSnapshot(s));

  static Future<SubcollectionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubcollectionRecord.fromSnapshot(s));

  static SubcollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubcollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubcollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubcollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubcollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubcollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubcollectionRecordData({
  String? name,
  String? image,
  String? desription,
  int? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'desription': desription,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubcollectionRecordDocumentEquality
    implements Equality<SubcollectionRecord> {
  const SubcollectionRecordDocumentEquality();

  @override
  bool equals(SubcollectionRecord? e1, SubcollectionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.image == e2?.image &&
        e1?.desription == e2?.desription &&
        e1?.price == e2?.price &&
        listEquality.equals(e1?.refer, e2?.refer);
  }

  @override
  int hash(SubcollectionRecord? e) => const ListEquality()
      .hash([e?.name, e?.image, e?.desription, e?.price, e?.refer]);

  @override
  bool isValidKey(Object? o) => o is SubcollectionRecord;
}
