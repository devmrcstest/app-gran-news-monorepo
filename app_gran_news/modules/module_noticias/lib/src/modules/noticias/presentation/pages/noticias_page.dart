import 'package:flutter/material.dart';
import 'package:lib_gran_core/lib_gran_core.dart';

import '../controllers/noticias_controller.dart';
import '../widgets/noticias_page/noticias_page_success.dart';

class NoticiasPage extends StatefulWidget {
  const NoticiasPage({Key? key}) : super(key: key);

  @override
  _NoticiasPageState createState() => _NoticiasPageState();
}

class _NoticiasPageState
    extends ModularState<NoticiasPage, NoticiasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notícias'),
      ),
      body: Observer(builder: (_) {
        if (controller.failureMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('😢', style: TextStyle(fontSize: 50)),
                const SizedBox(height: 16),
                Text(controller.failureMessage),
                const SizedBox(height: 16),
                ElevatedButton(
                  child: const Text('Tente novamente'),
                  onPressed: controller.pipeline,
                )
              ],
            ),
          );
        }

        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.noticias.isEmpty) {
          return Center(
            child: Text(controller.failureMessage),
          );
        }

        return NoticiasPageSuccess(controller: controller);
      }),
    );
  }
}
