import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';

import '../../common/domain/repository/preferences_repository.dart';
import '../../config/constants.dart';

@injectable
class CustomInterceptor extends Interceptor {
  final PreferencesRepository preferencesRepository;

  CustomInterceptor(this.preferencesRepository);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Map<String, dynamic> headers = options.headers;

    debugPrint("Request URL: ${options.uri}");

    if (options.data is Map<String, dynamic>) {
      final body = options.data as Map<String, dynamic>;

      options.data = body;
      debugPrint("RequestBody: ${jsonEncode(body)}");
    } else {
      debugPrint("Query Parameters: ${options.queryParameters}");
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
    debugPrint("ResponseBody: ${response.data}");
    super.onResponse(response, handler);
  }
}
