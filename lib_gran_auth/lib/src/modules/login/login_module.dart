import 'package:lib_gran_core/lib_gran_core.dart';

import 'presentation/controllers/login_controller.dart';
import 'presentation/pages/login_page.dart';

class LoginModule extends Module {
  static const String routeName = '/login';
  static const String initialRoute = '$routeName/';

  @override
  final List<Bind> binds = [
    // ------------------------ STORES ------------------------
    // --------------------- CONTROLLERS ----------------------
    Bind((i) => LoginController(
          onLoginSucessUseCase: i(),
        )),
    // ---------------------- USE CASES -----------------------
    // --------------------- REPOSITORIES ---------------------
    // --------------------- DATA SOURCES ---------------------
    // ------------------------ OTHERS ------------------------
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
