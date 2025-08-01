import 'package:crypto_tracker/core/base/usecase/base_usecase.dart';
import 'package:crypto_tracker/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CheckAuthUseCase extends BaseUseCaseNoParams<bool> {
  final AuthRepository _authRepository;

  CheckAuthUseCase(this._authRepository);
  @override
  Future<bool> call() {
    return _authRepository.checkAuth();
  }
}
