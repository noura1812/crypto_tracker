import 'package:crypto_tracker/features/crypto/domain/entities/crypto_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../core/network/client.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
@module
abstract class RegisterModule {
  @lazySingleton
  FlutterSecureStorage get storage => const FlutterSecureStorage();
  @preResolve
  Future<Isar> get isar async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open([CryptoEntitySchema], directory: dir.path);
  }

  Dio get dio => NetworkClient.getDio(getIt(), getIt());
}

Future<void> configureDependencies() async => getIt.init();
