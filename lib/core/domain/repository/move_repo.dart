import 'package:dartz/dartz.dart';
import 'package:movies_app/core/data/Model/AddToFavoriteRequest.dart';
import 'package:movies_app/core/data/Model/favorite_move.dart';
import 'package:movies_app/core/domain/Entities/Move_Entity.dart';

abstract class MoveRepo {
  Future<Either<String, List<MovieEntity>>> getMovies([int? limit]);
  Future<Either<String, List<MovieEntity>>> getMoviesbygenre({String? genre});
  Future<Either<String, FavoriteMovieModel>> addToFavorite({
    required AddToFavoriteRequest request,
  });
}
