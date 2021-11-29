import 'package:flutter/material.dart';
import 'package:lib_gran_core/lib_gran_core.dart';
import 'package:lib_gran_design/lib_gran_design.dart';

import '../controllers/eventos_controller.dart';

class EventosPage extends StatefulWidget {
  const EventosPage({Key? key}) : super(key: key);

  @override
  _EventosPageState createState() => _EventosPageState();
}

class _EventosPageState extends ModularState<EventosPage, EventosController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(72.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              GranImages.illustrations.reset_cycle,
              package: GranImages.package,
              height: 200,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Explore mais com a sua conta do Gran Cursos Online',
              textAlign: TextAlign.center,
              style: theme.textTheme.subtitle1,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Aproveite todos os recursos do aplicativo para continuar estudando',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.textTheme.bodyText2!.color!.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text(
                'Acessar minha conta',
                textAlign: TextAlign.center,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
