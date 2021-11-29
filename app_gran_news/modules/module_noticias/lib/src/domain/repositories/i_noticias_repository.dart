import 'package:lib_gran_core/lib_gran_core.dart';
import '../entities/noticia_compelta_entity.dart';

import '../entities/noticia_entity.dart';

abstract class INoticiasRepository {
  Future<Either<IFailure, List<Noticia>>> getNoticias();
  Future<Either<IFailure, NoticiaCompleta>> getNoticiaCompleta(
      {required String id});
}
