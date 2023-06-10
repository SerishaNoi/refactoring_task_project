abstract class LocalStorageHalper {
  Future<void> storeData<T>(String key, T data);

  dynamic getData(String hiveKey);
}
