import 'package:crypto_tracker/core/network/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class AuthDataSource {
  Future<String> login(String email, String password);
}

@LazySingleton(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  final Dio _dio;

  AuthDataSourceImpl({required Dio dio}) : _dio = dio;
  @override
  Future<String> login(String email, String password) async {
    var response = await _dio.get(
      Endpoints.login,
      data: {"email": email, "password": password},
    );

    return response.data["token"];
  }
}
