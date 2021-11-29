import 'package:flutter/material.dart';
import 'package:lib_gran_design/lib_gran_design.dart';

import '../../../../../domain/entities/noticia_entity.dart';
import '../../controllers/noticias_controller.dart';

class NoticiasPageSuccess extends StatelessWidget {
  const NoticiasPageSuccess({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final NoticiasController controller;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.pipeline,
      child: ListView.separated(
        itemCount: controller.noticias.length,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        separatorBuilder: (context, index) => const SizedBox(height: 16.0),
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          final Noticia noticia = controller.noticias[index];

          return GranCardWithImage(
            imagemURL: noticia.imagemURL,
            titulo: noticia.titulo,
            onTap: () => controller.handleTapNoticia(noticia),
          );
        },
      ),
    );
  }
}
