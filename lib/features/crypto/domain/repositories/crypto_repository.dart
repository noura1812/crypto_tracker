import 'package:crypto_tracker/core/network/models/async_result.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/crypto_entity.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/crypto_parameters/crypto_parameters.dart';

abstract class CryptoRepository {
  Future<AsyncResult<List<CryptoEntity>>> getCryptoList(
    CryptoParameters parameters,
  );
  Future<AsyncResult<List<CryptoEntity>>> getCryptoWishlist();
  Future<AsyncResult<void>> editWishlist(String id, {bool add = true});
}
