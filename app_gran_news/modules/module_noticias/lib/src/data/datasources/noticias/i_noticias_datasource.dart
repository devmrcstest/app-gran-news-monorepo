import '../../mappers/noticia_completa_mapper.dart';
import '../../mappers/noticia_mapper.dart';

abstract class INoticiaRemoteDataSource {
  Future<List<NoticiaMapper>> getNoticias();
  Future<NoticiaCompletaMapper> getNoticiaCompleta({required String id});
}
