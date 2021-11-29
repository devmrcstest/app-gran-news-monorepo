import 'dart:async';

import 'package:lib_gran_core/lib_gran_core.dart';

import '../../entities/conta_entity.dart';

abstract class IOnLoginSuccessUseCase
    implements UseCase<void, ParamsOnLoginSuccessUseCase> {
  @override
  Future<Either<IFailure, void>> call(params);
}

class ParamsOnLoginSuccessUseCase {
  final Conta conta;

  ParamsOnLoginSuccessUseCase({
    required this.conta,
  });
}
