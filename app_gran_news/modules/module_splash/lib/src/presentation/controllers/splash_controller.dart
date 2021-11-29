import 'package:lib_gran_auth/lib_gran_auth.dart';
import 'package:lib_gran_core/lib_gran_core.dart';
import 'package:mobx/mobx.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final INetworkInfo _networkInfo;
  final DioConfig _dioConfig;

  _SplashControllerBase(
      {required INetworkInfo networkInfo, required DioConfig dioConfig})
      : _networkInfo = networkInfo,
        _dioConfig = dioConfig {
    pipeline();
  }

  Future<void> pipeline() async {
    await _networkInfo.init();
    _dioConfig.init();

    await Future.delayed(const Duration(seconds: 1)).then((_) {
      Modular.to.pushReplacementNamed(GranAuthModule.initialRoute);
    });
  }
}
