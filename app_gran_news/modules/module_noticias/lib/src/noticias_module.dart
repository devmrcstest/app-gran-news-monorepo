import 'package:lib_gran_core/lib_gran_core.dart';

import 'data/datasources/noticias/i_noticias_datasource.dart';
import 'data/datasources/noticias/noticias_datasource.dart';
import 'data/repositories/noticias_repository.dart';
import 'domain/repositories/i_noticias_repository.dart';
import 'domain/usecases/get_noticia_usecase.dart';
import 'domain/usecases/get_noticias_usecase.dart';
import 'modules/detalhes_noticia/presentation/controllers/detalhes_noticia_controller.dart';
import 'modules/detalhes_noticia/presentation/pages/detalhes_noticia_page.dart';
import 'modules/noticias/presentation/controllers/noticias_controller.dart';
import 'modules/noticias/presentation/pages/noticias_page.dart';

class NoticiasModule extends Module {
  static const String routeName = '/noticias';
  static const String initialRoute = '$routeName/';

  static ModularProvider modularProvider = ModularProvider(
    module: NoticiasModule(),
    child: const NoticiasPage(),
  );

  @override
  final List<Bind> binds = [
    // ------------------------ STORES ------------------------
    // --------------------- CONTROLLERS ----------------------
    Bind((i) => NoticiasController(getNoticiasUseCase: i())),
    Bind((i) => DetalhesNoticiaController(
          getNoticiaUseCase: i(),
          noticia: i.args.data['noticia'],
        )),

    // ---------------------- USE CASES -----------------------
    Bind((i) => GetNoticiasUseCase(noticiasRepository: i())),
    Bind((i) => GetNoticiaCompletaUseCase(noticiasRepository: i())),

    // --------------------- REPOSITORIES ---------------------
    Bind<INoticiasRepository>(
      (i) => NoticiasRepository(
        networkInfo: i(),
        remoteDataSource: i(),
      ),
    ),

    // --------------------- DATA SOURCES ---------------------
    Bind<INoticiaRemoteDataSource>(
      (i) => NoticiasDioDataSource(
        dio: i(),
        logger: Logger('NoticiasDioDataSource'),
      ),
    ),

    // ------------------------ OTHERS ------------------------
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const NoticiasPage()),
    ChildRoute('/:id', child: (_, args) => const DetalhesNoticiaPage()),
  ];
}
