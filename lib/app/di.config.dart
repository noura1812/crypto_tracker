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

import '../core/common/data/repository_impl/local_repository_impl.dart' as _i7;
import '../core/common/domain/repository/local_repository.dart' as _i6;
import '../core/network/interceptors/custom_interceptor.dart' as _i17;
import '../core/network/interceptors/mock_interceptor.dart' as _i8;
import '../features/auth/data/datasources/auth_data_source.dart' as _i9;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i11;
import '../features/auth/domain/repositories/auth_repository.dart' as _i10;
import '../features/auth/domain/usecases/check_auth_use_case.dart' as _i12;
import '../features/auth/domain/usecases/login_use_case.dart' as _i21;
import '../features/auth/domain/usecases/logout_use_case.dart' as _i22;
import '../features/auth/presentation/bloc/auth_bloc.dart' as _i23;
import '../features/crypto/data/datasources/crypto_local_data_source.dart'
    as _i13;
import '../features/crypto/data/datasources/crypto_remote_data_source.dart'
    as _i14;
import '../features/crypto/data/repositories/crypto_repository_impl.dart'
    as _i16;
import '../features/crypto/domain/repositories/crypto_repository.dart' as _i15;
import '../features/crypto/domain/usecases/edit_wish_list_use_case.dart'
    as _i18;
import '../features/crypto/domain/usecases/get_crypto_list_use_case.dart'
    as _i19;
import '../features/crypto/domain/usecases/get_crypto_wish_list_usecase.dart'
    as _i20;
import '../features/crypto/presentation/pages/crypto_list/bloc/crypto_bloc.dart'
    as _i24;
import '../features/crypto/presentation/pages/crypto_wishlist/bloc/crypto_wishlist_bloc.dart'
    as _i25;
import 'di.dart' as _i26;

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
    gh.lazySingleton<_i6.LocalRepository>(
        () => _i7.LocalRepositoryImpl(gh<_i4.FlutterSecureStorage>()));
    gh.factory<_i8.MockInterceptor>(() => _i8.MockInterceptor());
    gh.lazySingleton<_i9.AuthDataSource>(
        () => _i9.AuthDataSourceImpl(dio: gh<_i3.Dio>()));
    gh.lazySingleton<_i10.AuthRepository>(() => _i11.AuthRepositoryImpl(
          gh<_i6.LocalRepository>(),
          authDataSource: gh<_i9.AuthDataSource>(),
        ));
    gh.factory<_i12.CheckAuthUseCase>(
        () => _i12.CheckAuthUseCase(gh<_i10.AuthRepository>()));
    gh.lazySingleton<_i13.CryptoLocalDataSource>(
        () => _i13.CryptoLocalDataSourceImpl(isar: gh<_i5.Isar>()));
    gh.lazySingleton<_i14.CryptoRemoteDataSource>(
        () => _i14.CryptoRemoteDataSourceImpl(dio: gh<_i3.Dio>()));
    gh.lazySingleton<_i15.CryptoRepository>(() => _i16.CryptoRepositoryImpl(
          gh<_i6.LocalRepository>(),
          cryptoLocalDataSource: gh<_i13.CryptoLocalDataSource>(),
          cryptoRemoteDataSource: gh<_i14.CryptoRemoteDataSource>(),
        ));
    gh.factory<_i17.CustomInterceptor>(
        () => _i17.CustomInterceptor(gh<_i6.LocalRepository>()));
    gh.factory<_i18.EditWishListUseCase>(
        () => _i18.EditWishListUseCase(gh<_i15.CryptoRepository>()));
    gh.factory<_i19.GetCryptoListUseCase>(
        () => _i19.GetCryptoListUseCase(gh<_i15.CryptoRepository>()));
    gh.factory<_i20.GetCryptoWishListUseCase>(
        () => _i20.GetCryptoWishListUseCase(gh<_i15.CryptoRepository>()));
    gh.factory<_i21.LoginUseCase>(
        () => _i21.LoginUseCase(gh<_i10.AuthRepository>()));
    gh.factory<_i22.LogoutUseCase>(
        () => _i22.LogoutUseCase(gh<_i10.AuthRepository>()));
    gh.lazySingleton<_i23.AuthBloc>(() => _i23.AuthBloc(
          gh<_i21.LoginUseCase>(),
          gh<_i22.LogoutUseCase>(),
          gh<_i12.CheckAuthUseCase>(),
        ));
    gh.factory<_i24.CryptoBloc>(
        () => _i24.CryptoBloc(gh<_i19.GetCryptoListUseCase>()));
    gh.lazySingleton<_i25.CryptoWishlistBloc>(() => _i25.CryptoWishlistBloc(
          gh<_i20.GetCryptoWishListUseCase>(),
          gh<_i18.EditWishListUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i26.RegisterModule {}
