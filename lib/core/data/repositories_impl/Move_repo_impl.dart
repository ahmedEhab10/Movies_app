import 'package:dartz/dartz.dart';
import 'package:movies_app/core/Errors/app_exception.dart';
import 'package:movies_app/core/data/data_source/Movies_remote_data_source.dart';
import 'package:movies_app/core/domain/Entities/Move_Entity.dart';
import 'package:movies_app/core/domain/repository/move_repo.dart';

class MoveRepoImpl implements MoveRepo {
  MoviesRemoteDataSource moviesRemoteDataSource;
  MoveRepoImpl({required this.moviesRemoteDataSource});
  @override
  Future<Either<String, List<MovieEntity>>> getMovies() async {
    try {
      final result = await moviesRemoteDataSource.getMovies();
      return Right(
        result.data!.movies!.map((move) => move.tomovieEntity()).toList(),
      );
    } on RemoteAppException catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<MovieEntity>>> getMoviesbygenre({
    String? genre,
  }) async {
    try {
      final result = await moviesRemoteDataSource.getMoviesBygenre(
        genre: genre,
      );
      return Right(
        result.data!.movies!.map((move) => move.tomovieEntity()).toList(),
      );
    } on RemoteAppException catch (e) {
      return Left(e.toString());
    }
  }
}
