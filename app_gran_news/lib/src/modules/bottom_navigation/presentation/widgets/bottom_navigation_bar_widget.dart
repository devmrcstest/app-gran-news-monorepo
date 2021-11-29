import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:lib_gran_design/lib_gran_design.dart';
import '../controller/bottom_navigation_controller.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState
    extends ModularState<BottomNavigationBarWidget, BottomNavigationController>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return BottomNavigationBar(
        onTap: controller.animatedToIndex,
        currentIndex: controller.currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Notícias',
            icon: Icon(GranIcons.noticias),
          ),
          BottomNavigationBarItem(
            label: 'Eventos',
            icon: Icon(GranIcons.eventos),
          ),
          BottomNavigationBarItem(
            label: 'Perfil',
            icon: Icon(GranIcons.perfil),
          ),
        ],
      );
    });
  }
}
