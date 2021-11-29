import 'package:lib_gran_core/lib_gran_core.dart';

import 'presentation/controllers/splash_controller.dart';
import 'presentation/pages/splash_page.dart';

class SplashModule extends Module {
  static const String routeName = '/splash';
  static const String initialRoute = '$routeName/';

  @override
  final List<Bind> binds = [
    // ------------------------ STORES ------------------------
    Bind((i) => SplashController(
          networkInfo: i(),
          dioConfig: i(),
        )),
    // --------------------- CONTROLLERS ----------------------
    // ---------------------- USE CASES -----------------------
    // --------------------- REPOSITORIES ---------------------
    // --------------------- DATA SOURCES ---------------------
    // ------------------------ OTHERS ------------------------
  ];

  @override
  List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const SplashPage(),
    ),
  ];
}
