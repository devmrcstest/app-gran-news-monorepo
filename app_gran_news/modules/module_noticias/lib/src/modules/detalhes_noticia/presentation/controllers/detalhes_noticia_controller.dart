import 'package:lib_gran_core/lib_gran_core.dart';

import '../../../../domain/entities/noticia_compelta_entity.dart';
import '../../../../domain/entities/noticia_entity.dart';
import '../../../../domain/usecases/get_noticia_usecase.dart';

part 'detalhes_noticia_controller.g.dart';

class DetalhesNoticiaController = _DetalhesNoticiaControllerBase
    with _$DetalhesNoticiaController;

abstract class _DetalhesNoticiaControllerBase with Store {
  final Noticia _noticia;
  final GetNoticiaCompletaUseCase _getNoticiaUseCase;

  _DetalhesNoticiaControllerBase({
    required Noticia noticia,
    required GetNoticiaCompletaUseCase getNoticiaUseCase,
  })  : _noticia = noticia,
        _getNoticiaUseCase = getNoticiaUseCase {
    pipeline();
  }

  @observable
  String failureMessage = '';

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Noticia> noticias = ObservableList<Noticia>();

  @observable
  NoticiaCompleta? noticiaCompleta;

  @action
  Future<void> pipeline() async {
    if (!isLoading) {
      isLoading = true;

      final failureOrNoticiaCompleta = await _getNoticiaUseCase(
        ParamsGetNoticiaUseCase(
          id: _noticia.id,
        ),
      );

      failureOrNoticiaCompleta.fold(
        (failure) => failureMessage = failure.message,
        (noticiaCompleta) => this.noticiaCompleta = noticiaCompleta,
      );
      isLoading = false;
    }
  }
}
