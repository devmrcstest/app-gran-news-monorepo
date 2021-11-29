import 'package:flutter/material.dart';

class GranCardWithImage extends StatelessWidget {
  const GranCardWithImage({
    Key? key,
    required this.onTap,
    required this.titulo,
    required this.imagemURL,
  }) : super(key: key);

  final VoidCallback onTap;
  final String titulo;
  final String imagemURL;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Material(
      elevation: 10.0,
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(4),
      shadowColor: theme.colorScheme.primaryVariant.withOpacity(0.2),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imagemURL),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(titulo),
            )
          ],
        ),
      ),
    );
  }
}
