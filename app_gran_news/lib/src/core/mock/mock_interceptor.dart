import 'dart:async';

import 'package:dio/dio.dart';

import 'noticias_mock.dart';

//! TODO: Delete this file after finish Backend
class MockInterceptor extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    late Response response;
    if (options.path.contains('/noticias')) {
      response = Response(
        requestOptions: options,
        statusCode: 200,
        data: kNoticiasResponseMock,
      );
    }
    if (options.path.contains('/noticias/')) {
      final String subString = options.path.split('/').last;

      response = Response(
        requestOptions: options,
        statusCode: 200,
        data: kNoticiasResponseMock.firstWhere(
          (element) => element['id']!.contains(subString),
          orElse: () => kNoticiasResponseMock.first,
        ),
      );
    }

    return handler.resolve(response);
  }
}
