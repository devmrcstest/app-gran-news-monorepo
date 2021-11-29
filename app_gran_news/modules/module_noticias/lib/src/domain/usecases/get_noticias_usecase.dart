import 'package:lib_gran_core/lib_gran_core.dart';

import '../entities/noticia_entity.dart';
import '../repositories/i_noticias_repository.dart';

class GetNoticiasUseCase implements UseCase<List<Noticia>, NoParams> {
  final INoticiasRepository _noticiaisRepository;

  GetNoticiasUseCase({
    required INoticiasRepository noticiasRepository,
  }) : _noticiaisRepository = noticiasRepository;

  @override
  Future<Either<IFailure, List<Noticia>>> call(params) async {
    return await _noticiaisRepository.getNoticias();
  }
}
