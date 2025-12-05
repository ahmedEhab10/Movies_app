import 'package:dartz/dartz.dart';
import 'package:movies_app/core/domain/Entities/Move_Entity.dart';
import 'package:movies_app/core/domain/repository/move_repo.dart';

class GetMoviesUsecase {
  MoveRepo moveRepo;
  GetMoviesUsecase({required this.moveRepo});

  Future<Either<String, List<MovieEntity>>> call() {
    return moveRepo.getMovies();
  }
}
