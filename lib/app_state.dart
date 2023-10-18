import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _OrderHistory = (await secureStorage.getStringList('ff_OrderHistory'))
              ?.map((path) => path.ref)
              .toList() ??
          _OrderHistory;
    });
    await _safeInitAsync(() async {
      _numberofitems =
          await secureStorage.getInt('ff_numberofitems') ?? _numberofitems;
    });
    await _safeInitAsync(() async {
      _favproduct = (await secureStorage.getStringList('ff_favproduct'))
              ?.map((path) => path.ref)
              .toList() ??
          _favproduct;
    });
    await _safeInitAsync(() async {
      _paymentmethod =
          await secureStorage.getString('ff_paymentmethod') ?? _paymentmethod;
    });
    await _safeInitAsync(() async {
      _paymentverification =
          await secureStorage.getString('ff_paymentverification') ??
              _paymentverification;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<DocumentReference> _cart = [];
  List<DocumentReference> get cart => _cart;
  set cart(List<DocumentReference> _value) {
    _cart = _value;
  }

  void addToCart(DocumentReference _value) {
    _cart.add(_value);
  }

  void removeFromCart(DocumentReference _value) {
    _cart.remove(_value);
  }

  void removeAtIndexFromCart(int _index) {
    _cart.removeAt(_index);
  }

  void updateCartAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _cart[_index] = updateFn(_cart[_index]);
  }

  void insertAtIndexInCart(int _index, DocumentReference _value) {
    _cart.insert(_index, _value);
  }

  int _CartSum = 0;
  int get CartSum => _CartSum;
  set CartSum(int _value) {
    _CartSum = _value;
  }

  List<DocumentReference> _OrderHistory = [];
  List<DocumentReference> get OrderHistory => _OrderHistory;
  set OrderHistory(List<DocumentReference> _value) {
    _OrderHistory = _value;
    secureStorage.setStringList(
        'ff_OrderHistory', _value.map((x) => x.path).toList());
  }

  void deleteOrderHistory() {
    secureStorage.delete(key: 'ff_OrderHistory');
  }

  void addToOrderHistory(DocumentReference _value) {
    _OrderHistory.add(_value);
    secureStorage.setStringList(
        'ff_OrderHistory', _OrderHistory.map((x) => x.path).toList());
  }

  void removeFromOrderHistory(DocumentReference _value) {
    _OrderHistory.remove(_value);
    secureStorage.setStringList(
        'ff_OrderHistory', _OrderHistory.map((x) => x.path).toList());
  }

  void removeAtIndexFromOrderHistory(int _index) {
    _OrderHistory.removeAt(_index);
    secureStorage.setStringList(
        'ff_OrderHistory', _OrderHistory.map((x) => x.path).toList());
  }

  void updateOrderHistoryAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _OrderHistory[_index] = updateFn(_OrderHistory[_index]);
    secureStorage.setStringList(
        'ff_OrderHistory', _OrderHistory.map((x) => x.path).toList());
  }

  void insertAtIndexInOrderHistory(int _index, DocumentReference _value) {
    _OrderHistory.insert(_index, _value);
    secureStorage.setStringList(
        'ff_OrderHistory', _OrderHistory.map((x) => x.path).toList());
  }

  int _numberofitems = 0;
  int get numberofitems => _numberofitems;
  set numberofitems(int _value) {
    _numberofitems = _value;
    secureStorage.setInt('ff_numberofitems', _value);
  }

  void deleteNumberofitems() {
    secureStorage.delete(key: 'ff_numberofitems');
  }

  List<DocumentReference> _favproduct = [];
  List<DocumentReference> get favproduct => _favproduct;
  set favproduct(List<DocumentReference> _value) {
    _favproduct = _value;
    secureStorage.setStringList(
        'ff_favproduct', _value.map((x) => x.path).toList());
  }

  void deleteFavproduct() {
    secureStorage.delete(key: 'ff_favproduct');
  }

  void addToFavproduct(DocumentReference _value) {
    _favproduct.add(_value);
    secureStorage.setStringList(
        'ff_favproduct', _favproduct.map((x) => x.path).toList());
  }

  void removeFromFavproduct(DocumentReference _value) {
    _favproduct.remove(_value);
    secureStorage.setStringList(
        'ff_favproduct', _favproduct.map((x) => x.path).toList());
  }

  void removeAtIndexFromFavproduct(int _index) {
    _favproduct.removeAt(_index);
    secureStorage.setStringList(
        'ff_favproduct', _favproduct.map((x) => x.path).toList());
  }

  void updateFavproductAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _favproduct[_index] = updateFn(_favproduct[_index]);
    secureStorage.setStringList(
        'ff_favproduct', _favproduct.map((x) => x.path).toList());
  }

  void insertAtIndexInFavproduct(int _index, DocumentReference _value) {
    _favproduct.insert(_index, _value);
    secureStorage.setStringList(
        'ff_favproduct', _favproduct.map((x) => x.path).toList());
  }

  String _paymentmethod = '';
  String get paymentmethod => _paymentmethod;
  set paymentmethod(String _value) {
    _paymentmethod = _value;
    secureStorage.setString('ff_paymentmethod', _value);
  }

  void deletePaymentmethod() {
    secureStorage.delete(key: 'ff_paymentmethod');
  }

  String _paymentverification = '';
  String get paymentverification => _paymentverification;
  set paymentverification(String _value) {
    _paymentverification = _value;
    secureStorage.setString('ff_paymentverification', _value);
  }

  void deletePaymentverification() {
    secureStorage.delete(key: 'ff_paymentverification');
  }

  List<DocumentReference> _productSearch = [];
  List<DocumentReference> get productSearch => _productSearch;
  set productSearch(List<DocumentReference> _value) {
    _productSearch = _value;
  }

  void addToProductSearch(DocumentReference _value) {
    _productSearch.add(_value);
  }

  void removeFromProductSearch(DocumentReference _value) {
    _productSearch.remove(_value);
  }

  void removeAtIndexFromProductSearch(int _index) {
    _productSearch.removeAt(_index);
  }

  void updateProductSearchAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _productSearch[_index] = updateFn(_productSearch[_index]);
  }

  void insertAtIndexInProductSearch(int _index, DocumentReference _value) {
    _productSearch.insert(_index, _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
