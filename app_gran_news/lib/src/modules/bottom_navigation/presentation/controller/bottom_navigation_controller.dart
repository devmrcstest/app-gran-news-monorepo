import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'bottom_navigation_controller.g.dart';

class BottomNavigationController = _BottomNavigationControllerBase
    with _$BottomNavigationController;

abstract class _BottomNavigationControllerBase
    with Store
    implements Disposable {
  final PageController pageController = PageController(initialPage: 0);
  @observable
  int currentIndex = 0;

  @action
  void setCurrentIndex(int index) {
    currentIndex = index;
  }

  @action
  void animatedToIndex(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {}
}
