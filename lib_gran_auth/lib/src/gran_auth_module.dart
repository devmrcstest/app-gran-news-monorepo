import 'package:lib_gran_core/lib_gran_core.dart';

import 'modules/login/login_module.dart';

class GranAuthModule extends Module {
  static const String routeName = '/auth';
  static const String initialRoute = loginPage;

  static const String loginPage = '$routeName${LoginModule.initialRoute}';

  @override
  final List<Bind> binds = [
    // ------------------------ STORES ------------------------
    // --------------------- CONTROLLERS ----------------------
    // ---------------------- USE CASES -----------------------
    // --------------------- REPOSITORIES ---------------------
    // --------------------- DATA SOURCES ---------------------
    // ------------------------ OTHERS ------------------------
  ];

  @override
  List<ModularRoute> routes = [
    ModuleRoute(LoginModule.routeName, module: LoginModule()),
  ];
}
