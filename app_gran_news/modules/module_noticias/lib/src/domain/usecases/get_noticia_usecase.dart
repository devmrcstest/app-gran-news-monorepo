import 'package:lib_gran_core/lib_gran_core.dart';

import '../entities/noticia_compelta_entity.dart';
import '../repositories/i_noticias_repository.dart';

class GetNoticiaCompletaUseCase
    implements UseCase<NoticiaCompleta, ParamsGetNoticiaUseCase> {
  final INoticiasRepository _noticiaisRepository;

  GetNoticiaCompletaUseCase({
    required INoticiasRepository noticiasRepository,
  }) : _noticiaisRepository = noticiasRepository;

  @override
  Future<Either<IFailure, NoticiaCompleta>> call(params) async {
    return await _noticiaisRepository.getNoticiaCompleta(id: params.id);
  }
}

class ParamsGetNoticiaUseCase {
  final String id;

  ParamsGetNoticiaUseCase({required this.id});
}
