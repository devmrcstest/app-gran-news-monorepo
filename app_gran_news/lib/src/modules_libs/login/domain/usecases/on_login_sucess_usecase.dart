import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:lib_gran_auth/lib_gran_auth.dart';
import 'package:lib_gran_core/lib_gran_core.dart';

import '../../../../modules/bottom_navigation/bottom_navigation_module.dart';

class OnLoginSucessUseCase implements IOnLoginSuccessUseCase {
  final Logger logger = Logger('OnLoginSucessUseCase');

  @override
  Future<Either<IFailure, void>> call(params) async {
    try {
      Modular.to.navigate(BottomNavigationModule.initialRoute);
      return Right(voidRight);
    } on IFailure catch (e, stackTrace) {
      logger.severe(e.message, e, stackTrace);
      return Left(e);
    }
  }
}
