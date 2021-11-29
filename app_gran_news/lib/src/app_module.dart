import 'package:lib_gran_auth/lib_gran_auth.dart';
import 'package:lib_gran_core/lib_gran_core.dart';
import 'package:lib_gran_design/lib_gran_design.dart';
import 'package:module_eventos/module_eventos.dart';
import 'package:module_noticias/module_noticias.dart';
import 'package:module_splash/module_splash.dart';

import '../main.dart';
import 'app_controller.dart';
import 'modules/bottom_navigation/bottom_navigation_module.dart';
import 'modules/perfil/perfil_module.dart';
import 'modules_libs/login/domain/usecases/on_login_sucess_usecase.dart';

class AppModule extends Module {
  static String get initialRoute => SplashModule.initialRoute;
  EndpointConfig get endpointConfig => endpointConfigProduction;
  FirebaseAnalytics get firebaseAnalytics => firebaseAnalyticsProduction;

  @override
  List<Bind> get binds => [
        // ------------------------ STORES ------------------------
        // --------------------- CONTROLLERS ----------------------
        Bind((i) => AppController(), isLazy: false),
        // ---------------------- USE CASES -----------------------
        /// -----> GranAuth
        Bind((i) => OnLoginSucessUseCase()),
        // --------------------- REPOSITORIES ---------------------
        // --------------------- DATA SOURCES ---------------------
        // ----------------------- SERVICES -----------------------
        Bind((i) => endpointConfig),
        Bind<FirebaseAnalytics>((i) => firebaseAnalytics),

        // -------------------- NOTIFICATIONS ---------------------
      ];

  @override
  final List<Module> imports = [
    GranDesignModule(),
    GranCoreModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    // ------------------------- LIBS -------------------------
    ModuleRoute(
      GranAuthModule.routeName,
      module: GranAuthModule(),
    ),

    // ----------------------- INTERNAL -----------------------
    ModuleRoute(
      BottomNavigationModule.routeName,
      module: BottomNavigationModule(),
    ),
    ModuleRoute(
      PerfilModule.routeName,
      module: PerfilModule(),
    ),

    // ----------------------- MODULES ------------------------
    ModuleRoute(
      SplashModule.routeName,
      module: SplashModule(),
    ),
    ModuleRoute(
      NoticiasModule.routeName,
      module: NoticiasModule(),
    ),
    ModuleRoute(
      EventosModule.routeName,
      module: EventosModule(),
    ),
  ];
}
