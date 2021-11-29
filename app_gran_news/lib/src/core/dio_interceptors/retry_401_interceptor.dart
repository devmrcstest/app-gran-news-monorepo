import 'package:dio/dio.dart';

class Retry401Interceptor extends Interceptor {
  final Dio client;

  Retry401Interceptor({required this.client});

  @override
  Future onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.type == DioErrorType.response &&
        (err.response!.statusCode == 401)) {
      // try {
      //   final failureOrSucess =
      //       await AuthWay.instance.renovarTokenAuthUseCase(const NoParams());

      //   if (failureOrSucess.isRight()) {
      //     final Response response = await client.request(
      //       err.requestOptions.path,
      //       cancelToken: err.requestOptions.cancelToken,
      //       data: err.requestOptions.data,
      //       queryParameters: err.requestOptions.queryParameters,
      //       onReceiveProgress: err.requestOptions.onReceiveProgress,
      //       onSendProgress: err.requestOptions.onSendProgress,
      //     );

      //     return handler.resolve(response);
      //   }
      // } catch (e) {
      //   handler.next(err);
      // }
    }
    return super.onError(err, handler);
  }
}
