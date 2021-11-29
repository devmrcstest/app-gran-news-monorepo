import 'package:lib_gran_core/lib_gran_core.dart';

import 'presentation/controllers/eventos_controller.dart';
import 'presentation/pages/eventos_page.dart';

class EventosModule extends Module {
  static const String routeName = '/eventos';
  static const String initialRoute = '$routeName/';

  static ModularProvider modularProvider = ModularProvider(
    module: EventosModule(),
    child: const EventosPage(),
  );

  @override
  final List<Bind> binds = [
    // ------------------------ STORES ------------------------
    // --------------------- CONTROLLERS ----------------------
    Bind((i) => EventosController()),
    // ---------------------- USE CASES -----------------------
    // --------------------- REPOSITORIES ---------------------
    // --------------------- DATA SOURCES ---------------------
    // ------------------------ OTHERS ------------------------
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const EventosPage()),
  ];
}
