import 'package:dio/dio.dart';

class ConnectivityRequestRetrier {
  final Dio client;

  ConnectivityRequestRetrier({
    required this.client,
  });

  Future<Response> scheduleRequestRetry(
    RequestOptions requestOptions, [
    Options? options,
  ]) async {
    return client.request(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
