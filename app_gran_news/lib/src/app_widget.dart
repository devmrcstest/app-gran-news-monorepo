import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lib_gran_core/lib_gran_core.dart';
import 'package:lib_gran_design/lib_gran_design.dart';

import 'app_module.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final ThemeStore themeStore = Modular.get<ThemeStore>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gran News',
          theme: GranThemes.light,
          darkTheme: GranThemes.dark,
          themeMode: themeStore.themeMode,
          initialRoute: AppModule.initialRoute,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          navigatorObservers: <NavigatorObserver>[observer],
          supportedLocales: const [Locale('pt', 'BR')],
        ).modular();
      },
    );
  }
}
