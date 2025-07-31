import 'package:crypto_tracker/core/base/usecase/base_usecase.dart';
import 'package:crypto_tracker/core/network/models/async_result.dart';
import 'package:crypto_tracker/features/crypto/domain/repositories/crypto_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class EditWishListUseCase extends BaseUseCase<AsyncResult, String> {
  final CryptoRepository _cryptoRepository;

  EditWishListUseCase(this._cryptoRepository);
  @override
  Future<AsyncResult<void>> call(String id, {bool add = true}) {
    return _cryptoRepository.editWishlist(id, add: add);
  }
}
