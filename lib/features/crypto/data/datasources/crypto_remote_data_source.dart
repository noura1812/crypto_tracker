import 'package:crypto_tracker/core/network/endpoints.dart';
import 'package:crypto_tracker/features/crypto/data/models/crypto_response.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/crypto_parameters/crypto_parameters.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class CryptoRemoteDataSource {
  Future<List<CryptoResponse>> getCryptoList(CryptoParameters parameters);
}

@LazySingleton(as: CryptoRemoteDataSource)
class CryptoRemoteDataSourceImpl implements CryptoRemoteDataSource {
  final Dio _dio;

  CryptoRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<CryptoResponse>> getCryptoList(
    CryptoParameters parameters,
  ) async {
    final response = await _dio.get(
      Endpoints.getCryptoList,
      queryParameters: parameters.toJson(),
    );
    // if (response.data['error'] != null) throw Exception(response.data['error']);
    var data =
        (response.data as List).map((e) => CryptoResponse.fromJson(e)).toList();
    return data;
  }
}
