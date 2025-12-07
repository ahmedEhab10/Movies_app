import 'package:dartz/dartz.dart';
import 'package:movies_app/core/domain/Entities/Move_Entity.dart';
import 'package:movies_app/core/domain/repository/move_repo.dart';

class GetMoviesByGenraUsecase {
  final MoveRepo moveRepo;
  GetMoviesByGenraUsecase(this.moveRepo);

  Future<Either<String, List<MovieEntity>>> call(String genre) {
    return moveRepo.getMoviesbygenre(genre: genre);
  }
}
