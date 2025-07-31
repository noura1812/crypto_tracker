import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/preferences_repository.dart';

@LazySingleton(as: PreferencesRepository)
class PreferencesRepositoryImpl implements PreferencesRepository {
  final FlutterSecureStorage secureStorage;

  PreferencesRepositoryImpl(this.secureStorage);

  @override
  Future<T?> getValueByKey<T>(String key) async {
    final value = await secureStorage.read(key: key);
    if (value == null) return null;

    // Try to infer type if not just String
    if (T == String) {
      return value as T;
    } else if (T == int) {
      return int.tryParse(value) as T?;
    } else if (T == double) {
      return double.tryParse(value) as T?;
    } else if (T == bool) {
      return (value == 'true') as T;
    } else {
      // Not supported
      return null;
    }
  }

  @override
  Future<void> insertValueByKey(String key, dynamic value) async {
    await secureStorage.write(key: key, value: value.toString());
  }

  @override
  Future<void> removeValueByKey(String key) async {
    await secureStorage.delete(key: key);
  }
}
