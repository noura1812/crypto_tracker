abstract class PreferencesRepository {
  Future<T?> getValueByKey<T>(String key);
  Future<void> insertValueByKey(String key, dynamic value);
  Future<void> removeValueByKey(String key);
}
