import 'package:flutter/material.dart';
import 'package:lib_gran_core/lib_gran_core.dart';

import '../controller/perfil_controller.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends ModularState<PerfilPage, PerfilController>
    with AutomaticKeepAliveClientMixin<PerfilPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 400,
            padding: const EdgeInsets.all(48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Perfil',
                  style: theme.textTheme.headline5!
                      .merge(TextStyle(color: theme.colorScheme.onPrimary)),
                ),
                const SizedBox(height: 32),
                Text('Acesse a sua conta',
                    style: theme.textTheme.headline5!
                        .merge(TextStyle(color: theme.colorScheme.onPrimary))),
                const SizedBox(height: 16),
                Text(
                  'Aproveite todos os recursos do aplicativo para continuar estudando',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyText2!.merge(TextStyle(
                      color: theme.colorScheme.onPrimary.withOpacity(0.4))),
                ),
              ],
            ),
            color: theme.colorScheme.primaryVariant,
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/images/background.png'),
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
