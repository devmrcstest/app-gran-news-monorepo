import 'package:lib_gran_core/lib_gran_core.dart';

import 'stores/theme_store.dart';

class GranDesignModule extends Module {
  @override
  final List<Bind> binds = [
    // ------------------------ STORES ------------------------
    Bind(
      (i) => ThemeStore(),
      export: true,
    ),
    // ---------------------- USE CASES -----------------------
    // --------------------- REPOSITORIES ---------------------
    // --------------------- DATA SOURCES ---------------------
    // ------------------------ OTHERS ------------------------
  ];
}
