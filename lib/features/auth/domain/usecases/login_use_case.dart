import 'package:crypto_tracker/core/base/usecase/base_usecase.dart';
import 'package:crypto_tracker/core/network/models/async_result.dart';
import 'package:crypto_tracker/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginUseCase extends BaseUseCase<AsyncResult, (String, String)> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);
  @override
  Future<AsyncResult<void>> call((String, String) parameters) {
    return _authRepository.login(parameters.$1, parameters.$2);
  }
}
