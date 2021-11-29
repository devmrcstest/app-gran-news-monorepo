import 'package:flutter/material.dart';
import 'package:lib_gran_core/lib_gran_core.dart';

import '../controllers/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primaryVariant,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo-gran-news.png',
              package: 'module_splash',
              width: 200,
              height: 200,
            ),
            CircularProgressIndicator(
              color: theme.colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
