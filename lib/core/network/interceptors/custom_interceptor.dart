import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../common/domain/repository/local_repository.dart';
import '../../config/constants.dart';

@injectable
class CustomInterceptor extends Interceptor {
  final LocalRepository preferencesRepository;

  CustomInterceptor(this.preferencesRepository);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Map<String, dynamic> headers = options.headers;

    if (options.data is Map<String, dynamic>) {
      final body = options.data as Map<String, dynamic>;

      options.data = body;
    }

    headers.addAll({
      'Authorization':
          'Bearer ${preferencesRepository.getValueByKey(AppConstants.tokenKey)}',
      'content-type': "application/json",
    });
    options.headers = headers;

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
