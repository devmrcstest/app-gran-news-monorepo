import 'dart:async';

import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    const String accessToken = '0912628357632497';

    final Map<String, dynamic> tokenHeader = {
      'Authorization': 'Bearer $accessToken'
    };

    options.headers.addAll(tokenHeader);

    return super.onRequest(options, handler);
  }
}
