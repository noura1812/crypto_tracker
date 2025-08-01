import 'package:crypto_tracker/core/network/models/async_result.dart';

abstract class AuthRepository {
  Future<AsyncResult<void>> login(String email, String password);
  Future<AsyncResult<void>> logout();
  Future<bool> checkAuth();
}
