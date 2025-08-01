import 'package:crypto_tracker/core/common/domain/repository/local_repository.dart';
import 'package:crypto_tracker/core/config/constants.dart';
import 'package:crypto_tracker/core/network/error/error_handler.dart';
import 'package:crypto_tracker/core/network/models/async_result.dart';
import 'package:crypto_tracker/features/auth/data/datasources/auth_data_source.dart';
import 'package:crypto_tracker/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;
  final LocalRepository _localRepository;

  AuthRepositoryImpl(
    this._localRepository, {
    required AuthDataSource authDataSource,
  }) : _authDataSource = authDataSource;
  @override
  Future<AsyncResult<void>> login(String email, String password) async {
    try {
      var token = await _authDataSource.login(email, password);
      _localRepository.insertValueByKey("token", token);
      return Data(null);
    } catch (e) {
      return Error(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<AsyncResult<void>> logout() async {
    try {
      await _localRepository.removeValueByKey(AppConstants.tokenKey);
      return Data(null);
    } catch (e) {
      return Error(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<bool> checkAuth() async {
    String? token = await _localRepository.getValueByKey(AppConstants.tokenKey);
    return (token != null);
  }
}
