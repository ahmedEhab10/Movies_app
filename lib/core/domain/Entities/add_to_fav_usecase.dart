import 'package:dartz/dartz.dart';
import 'package:movies_app/core/data/Model/AddToFavoriteRequest.dart';
import 'package:movies_app/core/data/Model/favorite_move.dart';
import 'package:movies_app/core/domain/repository/move_repo.dart';

class AddToFavoriteUseCase {
  final MoveRepo moveRepo;

  AddToFavoriteUseCase({required this.moveRepo});

  Future<Either<String, FavoriteMovieModel>> call(
    AddToFavoriteRequest request,
  ) {
    return moveRepo.addToFavorite(request: request);
  }
}
