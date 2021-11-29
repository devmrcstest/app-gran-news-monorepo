import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lib_gran_design/lib_gran_design.dart';
import 'package:module_eventos/module_eventos.dart';
import 'package:module_noticias/module_noticias.dart';

import '../../../perfil/perfil_module.dart';
import '../controller/bottom_navigation_controller.dart';
import '../widgets/bottom_navigation_bar_widget.dart';

class BottomNavigationPage extends StatefulWidget {
  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState
    extends ModularState<BottomNavigationPage, BottomNavigationController>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: ScrollConfiguration(
        behavior: DisableGlowBehavior(),
        child: PageView(
          controller: controller.pageController,
          onPageChanged: controller.setCurrentIndex,
          children: [
            NoticiasModule.modularProvider,
            EventosModule.modularProvider,
            PerfilModule.modularProvider,
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
