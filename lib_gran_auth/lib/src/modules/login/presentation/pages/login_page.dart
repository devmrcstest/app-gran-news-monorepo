import 'package:flutter/material.dart';
import 'package:lib_gran_core/lib_gran_core.dart';
import 'package:lib_gran_design/lib_gran_design.dart';

import '../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final GranColors granColors = GranColors.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: GranColors.of(context).primaryDark,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          width: mediaQuery.size.width,
          height: mediaQuery.size.height -
              mediaQuery.padding.top -
              mediaQuery.padding.bottom,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.asset(
                  GranImages.logo.logo_gran_cursos_dark,
                  package: GranImages.package,
                ),
              ),
              LoginButton(
                fontColor: granColors.red,
                onPressed: controller.handleTapLogin,
                icon: const Icon(Icons.account_circle),
                label: 'Entrar com Google',
              ),
              const SizedBox(height: 12),
              LoginButton(
                fontColor: granColors.blue,
                onPressed: controller.handleTapLogin,
                label: 'Entrar com Facebook',
                icon: const Icon(Icons.account_circle),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Divider(color: granColors.white),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'OU',
                    style: TextStyle(color: granColors.white.withOpacity(0.4)),
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Divider(color: granColors.white)),
                ],
              ),
              const SizedBox(height: 16),
              LoginButton(
                fontColor: granColors.black,
                onPressed: controller.handleTapLogin,
                label: 'Entrar com E-mail',
                icon: const Icon(Icons.mail_outline_rounded),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: controller.handleTapLogin,
                child: const Text(
                  'Entrar sem login',
                ),
                style: TextButton.styleFrom(primary: granColors.white),
              ),
              const SizedBox(height: 32),
              Text(
                'Ao fazer login, você concorda automaticamente com nossos Termos de uso e Políticas de privacidade',
                textAlign: TextAlign.center,
                style: theme.textTheme.caption!.merge(
                  TextStyle(
                    color: granColors.white.withOpacity(0.3),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.fontColor,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Color fontColor;
  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final GranColors granColors = GranColors.of(context);

    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            icon,
            Expanded(
              child: Center(
                child: Text(label),
              ),
            ),
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: granColors.white,
        onPrimary: fontColor,
      ),
      onPressed: onPressed,
    );
  }
}
