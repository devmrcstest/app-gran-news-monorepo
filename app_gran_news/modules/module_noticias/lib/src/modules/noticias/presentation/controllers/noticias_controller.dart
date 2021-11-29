import 'package:lib_gran_core/lib_gran_core.dart';

import '../../../../../module_noticias.dart';
import '../../../../domain/entities/noticia_entity.dart';
import '../../../../domain/usecases/get_noticias_usecase.dart';

part 'noticias_controller.g.dart';

class NoticiasController = _NoticiasControllerBase with _$NoticiasController;

abstract class _NoticiasControllerBase with Store {
  final GetNoticiasUseCase _getNoticiasUseCase;

  _NoticiasControllerBase({
    required GetNoticiasUseCase getNoticiasUseCase,
  }) : _getNoticiasUseCase = getNoticiasUseCase {
    pipeline();
  }

  @observable
  String failureMessage = '';

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Noticia> noticias = ObservableList<Noticia>();

  @action
  Future<void> pipeline() async {
    if (!isLoading) {
      isLoading = true;
      final failureOrNoticias = await _getNoticiasUseCase(const NoParams());

      failureOrNoticias.fold(
        (failure) => failureMessage = failure.message,
        (noticias) => this.noticias = noticias.asObservable(),
      );
      isLoading = false;
    }
  }

  Future<void> handleTapNoticia(Noticia noticia) async {
    await Modular.to.pushNamed(
      '${NoticiasModule.routeName}/${noticia.id}',
      arguments: {
        'noticia': noticia,
      },
    );
  }
}
