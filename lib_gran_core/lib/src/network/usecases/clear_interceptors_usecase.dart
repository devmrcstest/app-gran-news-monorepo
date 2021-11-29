import 'package:dartz/dartz.dart';

import '../../error/failures.dart';
import '../../usecases/usecase.dart';
import '../dio_config.dart';

class ClearInterceptorsUseCase implements UseCaseSync<void, NoParams> {
  final DioConfig _dioConfig;

  ClearInterceptorsUseCase({
    required DioConfig dioConfig,
  }) : _dioConfig = dioConfig;

  @override
  Either<IFailure, void> call(params) {
    try {
      return Right(_dioConfig.clearInterceptors());
    } catch (e) {
      return const Left(
        InternalFailure(
          message: 'Falha interna: Limpeza dos interceptors',
        ),
      );
    }
  }
}
