import 'package:flutter/material.dart';

import '../../../../../domain/entities/noticia_compelta_entity.dart';

class DetalhesNoticiaPageSuccess extends StatelessWidget {
  const DetalhesNoticiaPageSuccess({
    Key? key,
    required this.noticiaCompleta,
  }) : super(key: key);

  final NoticiaCompleta noticiaCompleta;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(noticiaCompleta.titulo, style: theme.textTheme.headline5),
          const SizedBox(height: 16),
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(noticiaCompleta.imagemURL),
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          const SizedBox(height: 16),
          Text(noticiaCompleta.descricao),
        ],
      ),
    );
  }
}
