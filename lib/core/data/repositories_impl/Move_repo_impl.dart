import 'package:dartz/dartz.dart';
import 'package:movies_app/core/Errors/app_exception.dart';
import 'package:movies_app/core/data/Model/AddToFavoriteRequest.dart';
import 'package:movies_app/core/data/Model/favorite_move.dart';
import 'package:movies_app/core/data/data_source/Movies_remote_data_source.dart';
import 'package:movies_app/core/domain/Entities/Move_Entity.dart';
import 'package:movies_app/core/domain/repository/move_repo.dart';
import 'package:movies_app/features/Auth/data/data_source/Local/auth_local_impl_data_source.dart';

class MoveRepoImpl implements MoveRepo {
  MoviesRemoteDataSource moviesRemoteDataSource;
  MoveRepoImpl({required this.moviesRemoteDataSource});
  @override
  Future<Either<String, List<MovieEntity>>> getMovies([int? limit]) async {
    try {
      final result = await moviesRemoteDataSource.getMovies(limit);
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

  @override
  Future<Either<String, FavoriteMovieModel>> addToFavorite({
    required AddToFavoriteRequest request,
  }) async {
    try {
      final token = await AuthLocalImplDataSource().getToken();
      final result = await moviesRemoteDataSource.addToFavorite(
        request: request,
        token: token,
      );
      return Right(result.favoriteMovie);
    } on RemoteAppException catch (e) {
      return Left(e.message);
    }
  }
}
