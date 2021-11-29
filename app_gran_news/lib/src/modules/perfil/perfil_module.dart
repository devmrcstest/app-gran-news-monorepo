import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/controller/perfil_controller.dart';
import 'presentation/pages/perfil_page.dart';

class PerfilModule extends Module {
  static const String routeName = '/perfil';
  static const String initialRoute = '$routeName/';

  static ModularProvider modularProvider = ModularProvider(
    module: PerfilModule(),
    child: PerfilPage(),
  );

  @override
  final List<Bind> binds = [
    // --------------------- CONTROLLERS ----------------------
    Bind((i) => PerfilController()),
    // ---------------------- USE CASES -----------------------
    // --------------------- REPOSITORIES ---------------------
    // --------------------- DATA SOURCES ---------------------
    // ------------------------ OTHERS ------------------------
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => PerfilPage(),
    ),
  ];
}
