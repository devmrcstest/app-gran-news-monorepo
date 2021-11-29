import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lib_gran_core/lib_gran_core.dart';

import 'src/app_module.dart';
import 'src/app_widget.dart';

final EndpointConfig endpointConfigProduction = EndpointConfig.production(
  apiName: 'grannews/api',
);
late final FirebaseAnalytics firebaseAnalyticsProduction;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  firebaseAnalyticsProduction = FirebaseAnalytics();
  await firebaseAnalyticsProduction.setAnalyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  Isolate.current.addErrorListener(RawReceivePort((pair) async {
    final List<dynamic> errorAndStacktrace = pair;
    await FirebaseCrashlytics.instance.recordError(
      errorAndStacktrace.first,
      errorAndStacktrace.last,
    );
  }).sendPort);

  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((LogRecord record) {
    log('${record.level.name}: ${record.time}: ${record.message}');
  });

  Modular.to.addListener(() {
    Logger.root.info(Modular.to.path);
  });

  runApp(ModularApp(
    module: AppModule(),
    child: AppWidget(),
  ));
}
