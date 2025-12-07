import 'package:dartz/dartz.dart';
import 'package:movies_app/core/domain/Entities/Move_Entity.dart';
import 'package:movies_app/core/domain/repository/move_repo.dart';

class GetMovieSuggestionsUsecase {
  final MoveRepo moveRepo;

  GetMovieSuggestionsUsecase({required this.moveRepo});

  Future<Either<String, List<MovieEntity>>> call(int movieId) {
    return moveRepo.getSuggestions(movieId: movieId);
  }
}
