import 'package:lib_gran_core/lib_gran_core.dart';

import '../../../../core/domain/entities/conta_entity.dart';
import '../../../../core/domain/usecases/export/i_on_login_success_usecase.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final IOnLoginSuccessUseCase _onLoginSucessUseCase;

  _LoginControllerBase({
    required IOnLoginSuccessUseCase onLoginSucessUseCase,
  }) : _onLoginSucessUseCase = onLoginSucessUseCase;

  Future<void> handleTapLogin() async {
    await _onLoginSucessUseCase(
      ParamsOnLoginSuccessUseCase(
        conta: const Conta(
          email: 'marcos.souza@grancursosonline.com.br',
          senha: '123456',
        ),
      ),
    );
  }
}
