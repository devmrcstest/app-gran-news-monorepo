import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'network/dio_config.dart';
import 'network/network_info.dart';
import 'network/usecases/clear_interceptors_usecase.dart';

class GranCoreModule extends Module {
  @override
  final List<Bind> binds = [
    // ------------------------ STORES ------------------------
    // ---------------------- USE CASES -----------------------
    /// -----> NetWork
    Bind(
      (i) => ClearInterceptorsUseCase(dioConfig: i()),
      export: true,
    ),

    // --------------------- REPOSITORIES ---------------------
    // --------------------- DATA SOURCES ---------------------
    // ------------------------ OTHERS ------------------------
    // ----------------------- NETWORK ------------------------
    Bind<INetworkInfo>(
      (i) => NetworkInfo(),
      export: true,
    ),
    Bind(
      (i) => Dio(),
      export: true,
    ),
    Bind(
      (i) => DioConfig(
        dio: i(),
        endpointConfig: i(),
      ),
      export: true,
    ),
    // ----------------------- FIREBASE -----------------------
    Bind<FirebaseCrashlytics>(
      (i) => FirebaseCrashlytics.instance,
      export: true,
    ),

    // ---------------------- DATASBASE -----------------------
    AsyncBind(
      (i) => SharedPreferences.getInstance(),
      export: true,
    ),
  ];
}
