import 'package:crypto_tracker/core/base/usecase/base_usecase.dart';
import 'package:crypto_tracker/core/network/models/async_result.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/crypto_parameters/crypto_parameters.dart';
import 'package:crypto_tracker/features/crypto/domain/repositories/crypto_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetCryptoListUseCase extends BaseUseCase<AsyncResult, CryptoParameters> {
  final CryptoRepository _cryptoRepository;

  GetCryptoListUseCase(this._cryptoRepository);
  @override
  Future<AsyncResult<void>> call(CryptoParameters parameters) {
    return _cryptoRepository.getCryptoList(parameters);
  }
}
