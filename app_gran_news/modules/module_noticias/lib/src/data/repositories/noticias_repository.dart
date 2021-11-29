import 'package:dartz/dartz.dart';
import 'package:lib_gran_core/lib_gran_core.dart';

import '../../domain/entities/noticia_compelta_entity.dart';
import '../../domain/entities/noticia_entity.dart';
import '../../domain/repositories/i_noticias_repository.dart';
import '../datasources/noticias/i_noticias_datasource.dart';
import '../mappers/noticia_completa_mapper.dart';
import '../mappers/noticia_mapper.dart';

class NoticiasRepository implements INoticiasRepository {
  final INoticiaRemoteDataSource _remoteDataSource;
  final INetworkInfo _networkInfo;

  NoticiasRepository({
    required INoticiaRemoteDataSource remoteDataSource,
    required INetworkInfo networkInfo,
  })  : _remoteDataSource = remoteDataSource,
        _networkInfo = networkInfo;

  @override
  Future<Either<IFailure, List<Noticia>>> getNoticias() async {
    if (await _networkInfo.isConnected) {
      try {
        final List<NoticiaMapper> noticiasModel =
            await _remoteDataSource.getNoticias();

        final List<Noticia> rotas = List<Noticia>.from(
          noticiasModel.map((e) => e.toEntity()),
        );

        return Right(rotas);
      } on ServerException catch (e) {
        return Left(
          ServerFailure(
            message: e.message,
          ),
        );
      }
    } else {
      return const Left(InternetConectionFailure());
    }
  }

  @override
  Future<Either<IFailure, NoticiaCompleta>> getNoticiaCompleta(
      {required String id}) async {
    if (await _networkInfo.isConnected) {
      try {
        final NoticiaCompletaMapper noticiasModel =
            await _remoteDataSource.getNoticiaCompleta(id: id);

        return Right(noticiasModel.toEntity());
      } on ServerException catch (e) {
        return Left(
          ServerFailure(
            message: e.message,
          ),
        );
      }
    } else {
      return const Left(InternetConectionFailure());
    }
  }
}
