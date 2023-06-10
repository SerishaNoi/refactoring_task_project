import 'package:eds_test/data/services/local_storage_halper/local_starage_halper.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageHalperImpl extends LocalStorageHalper {
  @override
  Future<void> storeData<T>(String key, T data) async {
    final box = await _getBoxByKey(key);
    if (box == null) return;

    await box.put(key, data);
  }

  @override
  dynamic getData(String hiveKey) async {
    final box = await _getBoxByKey(hiveKey);
    if (box == null) return null;

    return box.get(hiveKey);
  }

  Future<Box<dynamic>?> _getBoxByKey(String key) async {
    return Hive.openBox<dynamic>(key);
  }
}
