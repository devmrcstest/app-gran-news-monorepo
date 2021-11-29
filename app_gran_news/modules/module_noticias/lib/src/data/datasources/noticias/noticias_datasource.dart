import 'package:lib_gran_core/lib_gran_core.dart';

import '../../mappers/noticia_completa_mapper.dart';
import '../../mappers/noticia_mapper.dart';
import 'i_noticias_datasource.dart';

class NoticiasDioDataSource implements INoticiaRemoteDataSource {
  final Dio _dio;
  final Logger _logger;

  NoticiasDioDataSource({
    required Dio dio,
    required Logger logger,
  })  : _dio = dio,
        _logger = logger;

  @override
  Future<List<NoticiaMapper>> getNoticias() async {
    const String failureMessage = 'Houve um problema ao buscar as notícias';

    try {
      final response = await _dio.get('/noticias');

      if (response.statusCode == 200) {
        final responseBody = response.data;

        return List.generate(
          responseBody.length,
          (i) => NoticiaMapper.fromMap(
            responseBody[i],
          ),
        );
      } else {
        throw ServerException(message: failureMessage);
      }
    } on ServerException catch (e, stacktrace) {
      _logger.severe(e.message, stacktrace);
      rethrow;
    } catch (e, stacktrace) {
      _logger.severe(e.toString(), stacktrace);
      throw ServerException(message: failureMessage);
    }
  }

  @override
  Future<NoticiaCompletaMapper> getNoticiaCompleta({required String id}) async {
    const String failureMessage = 'Houve um problema ao buscar a notícia';

    try {
      final response = await _dio.get('/noticias/$id');

      if (response.statusCode == 200) {
        final responseBody = response.data;

        return NoticiaCompletaMapper.fromMap(responseBody);
      } else {
        throw ServerException(message: failureMessage);
      }
    } on ServerException catch (e, stacktrace) {
      _logger.severe(e.message, stacktrace);
      rethrow;
    } catch (e, stacktrace) {
      _logger.severe(e.toString(), stacktrace);
      throw ServerException(message: failureMessage);
    }
  }
}
