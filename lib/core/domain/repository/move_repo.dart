import 'package:dartz/dartz.dart';
import 'package:movies_app/core/domain/Entities/Move_Entity.dart';

abstract class MoveRepo {
  Future<Either<String, List<MovieEntity>>> getMovies();
}
