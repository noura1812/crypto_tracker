// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i5;

import '../core/common/data/repository_impl/preferences_repository_impl.dart'
    as _i8;
import '../core/common/domain/repository/preferences_repository.dart' as _i7;
import '../core/network/interceptors/custom_interceptor.dart' as _i13;
import '../core/network/interceptors/mock_interceptor.dart' as _i6;
import '../features/crypto/data/datasources/crypto_local_data_source.dart'
    as _i9;
import '../features/crypto/data/datasources/crypto_remote_data_source.dart'
    as _i10;
import '../features/crypto/data/repositories/crypto_repository_impl.dart'
    as _i12;
import '../features/crypto/domain/repositories/crypto_repository.dart' as _i11;
import '../features/crypto/domain/usecases/edit_wish_list_use_case.dart'
    as _i14;
import '../features/crypto/domain/usecases/get_crypto_list_use_case.dart'
    as _i15;
import 'di.dart' as _i16;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i4.FlutterSecureStorage>(() => registerModule.storage);
    await gh.factoryAsync<_i5.Isar>(
      () => registerModule.isar,
      preResolve: true,
    );
    gh.factory<_i6.MockInterceptor>(() => _i6.MockInterceptor());
    gh.lazySingleton<_i7.PreferencesRepository>(
        () => _i8.PreferencesRepositoryImpl(gh<_i4.FlutterSecureStorage>()));
    gh.lazySingleton<_i9.CryptoLocalDataSource>(
        () => _i9.CryptoLocalDataSourceImpl(isar: gh<_i5.Isar>()));
    gh.lazySingleton<_i10.CryptoRemoteDataSource>(
        () => _i10.CryptoRemoteDataSourceImpl(dio: gh<_i3.Dio>()));
    gh.lazySingleton<_i11.CryptoRepository>(() => _i12.CryptoRepositoryImpl(
          cryptoLocalDataSource: gh<_i9.CryptoLocalDataSource>(),
          cryptoRemoteDataSource: gh<_i10.CryptoRemoteDataSource>(),
        ));
    gh.factory<_i13.CustomInterceptor>(
        () => _i13.CustomInterceptor(gh<_i7.PreferencesRepository>()));
    gh.factory<_i14.EditWishListUseCase>(
        () => _i14.EditWishListUseCase(gh<_i11.CryptoRepository>()));
    gh.factory<_i15.GetCryptoListUseCase>(
        () => _i15.GetCryptoListUseCase(gh<_i11.CryptoRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i16.RegisterModule {}
