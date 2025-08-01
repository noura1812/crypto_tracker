import 'package:crypto_tracker/core/base/usecase/base_usecase.dart';
import 'package:crypto_tracker/core/network/models/async_result.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/crypto_entity.dart';
import 'package:crypto_tracker/features/crypto/domain/repositories/crypto_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetCryptoWishListUseCase
    extends BaseUseCaseNoParams<AsyncResult<List<CryptoEntity>>> {
  final CryptoRepository _cryptoRepository;

  GetCryptoWishListUseCase(this._cryptoRepository);
  @override
  Future<AsyncResult<List<CryptoEntity>>> call() {
    return _cryptoRepository.getCryptoWishlist();
  }
}
