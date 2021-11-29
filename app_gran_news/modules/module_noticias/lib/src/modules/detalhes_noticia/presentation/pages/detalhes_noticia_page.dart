import 'package:flutter/material.dart';
import 'package:lib_gran_core/lib_gran_core.dart';

import '../controllers/detalhes_noticia_controller.dart';
import '../widgets/detalhes_noticia_page/detalhes_noticia_page_success.dart';

class DetalhesNoticiaPage extends StatefulWidget {
  const DetalhesNoticiaPage({Key? key}) : super(key: key);

  @override
  _DetalhesNoticiaPageState createState() => _DetalhesNoticiaPageState();
}

class _DetalhesNoticiaPageState
    extends ModularState<DetalhesNoticiaPage, DetalhesNoticiaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(builder: (_) {
        if (controller.failureMessage.isNotEmpty) {
          return Center(
            child: Text(controller.failureMessage),
          );
        }

        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return DetalhesNoticiaPageSuccess(
          noticiaCompleta: controller.noticiaCompleta!,
        );
      }),
    );
  }
}
