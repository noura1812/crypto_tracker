import 'package:crypto_tracker/core/base/usecase/base_usecase.dart';
import 'package:crypto_tracker/core/network/models/async_result.dart';
import 'package:crypto_tracker/features/crypto/data/models/search_response.dart';
import 'package:crypto_tracker/features/crypto/domain/repositories/crypto_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SearchUseCase extends BaseUseCase<AsyncResult<SearchResponse>, String> {
  final CryptoRepository _cryptoRepository;

  SearchUseCase(this._cryptoRepository);
  @override
  Future<AsyncResult<SearchResponse>> call(String text) {
    return _cryptoRepository.search(text);
  }
}
