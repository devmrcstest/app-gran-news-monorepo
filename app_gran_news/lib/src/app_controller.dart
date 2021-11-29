import 'package:lib_gran_core/lib_gran_core.dart';

import 'core/mock/mock_interceptor.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  _AppControllerBase() {
    //! TODO: Remove this after finish Backend
    Modular.get<Dio>().interceptors.add(MockInterceptor());
  }

  bool _hasOnPaused = false;
  void onResumed() {
    if (_hasOnPaused) {
      _hasOnPaused = false;
      // _refreshAppInBackground();
    }
  }

  void onPaused() => _hasOnPaused = true;
  void onInactive() {}
  void onDetached() {}
}
