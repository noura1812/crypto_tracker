import 'package:crypto_tracker/core/network/error/error_handler.dart';
import 'package:crypto_tracker/core/network/models/async_result.dart';
import 'package:crypto_tracker/features/crypto/data/datasources/crypto_local_data_source.dart';
import 'package:crypto_tracker/features/crypto/data/datasources/crypto_remote_data_source.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/crypto_entity.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/crypto_parameters/crypto_parameters.dart';
import 'package:crypto_tracker/features/crypto/domain/repositories/crypto_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:crypto_tracker/features/crypto/data/mappers/crypto_mapper.dart';

@LazySingleton(as: CryptoRepository)
class CryptoRepositoryImpl implements CryptoRepository {
  final CryptoLocalDataSource _cryptoLocalDataSource;
  final CryptoRemoteDataSource _cryptoRemoteDataSource;

  CryptoRepositoryImpl({
    required CryptoLocalDataSource cryptoLocalDataSource,
    required CryptoRemoteDataSource cryptoRemoteDataSource,
  }) : _cryptoLocalDataSource = cryptoLocalDataSource,
       _cryptoRemoteDataSource = cryptoRemoteDataSource;
  @override
  Future<AsyncResult<void>> editWishlist(String id, {bool add = true}) async {
    try {
      if (add) {
        await _cryptoLocalDataSource.addToWishlist(id);
      } else {
        await _cryptoLocalDataSource.removeFromWishlist(id);
      }
      return Data(null);
    } catch (e) {
      return Error(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<AsyncResult<List<CryptoEntity>>> getCryptoList(
    CryptoParameters parameters,
  ) async {
    try {
      final cryptoList = await _cryptoRemoteDataSource.getCryptoList(
        parameters,
      );
      var data = cryptoList.map((e) => e.toEntity()).toList();

      if (parameters.page == 1) {
        _cryptoLocalDataSource.saveCryptoList(data);
      }

      return Data(data);
    } catch (e) {
      var error = ErrorHandler.handleError(e);
      var data =
          parameters.page == 1
              ? await _cryptoLocalDataSource.getCryptoList()
              : null;
      return Error(error, data: data);
    }
  }

  @override
  Future<AsyncResult<List<CryptoEntity>>> getCryptoWishlist() async {
    try {
      var data = await _cryptoLocalDataSource.getWishlist();
      return Data(data);
    } catch (e) {
      return Error(ErrorHandler.handleError(e));
    }
  }
}
