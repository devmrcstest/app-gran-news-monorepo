import '../../lib_gran_core.dart';

class DioConfig {
  final Dio _dio;
  final EndpointConfig _endpointConfig;

  DioConfig({
    required Dio dio,
    required EndpointConfig endpointConfig,
  })  : _dio = dio,
        _endpointConfig = endpointConfig;

  void init() {
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(minutes: 1).inMilliseconds,
      baseUrl: _endpointConfig.baseUrl,
    );
    _dio.options = baseOptions;
  }

  void clearInterceptors() => _dio.interceptors.clear();
}
