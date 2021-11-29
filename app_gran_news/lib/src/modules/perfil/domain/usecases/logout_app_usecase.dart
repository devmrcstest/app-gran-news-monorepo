import 'package:lib_gran_core/lib_gran_core.dart';

class LogoutAppUseCase implements UseCase<void, NoParams> {
  @override
  Future<Either<IFailure, void>> call(params) async {
    try {
      return Right(voidRight);
    } on IFailure catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(InternalFailure());
    }
  }
}
