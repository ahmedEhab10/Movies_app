import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/data/Model/AddToFavoriteRequest.dart';
import 'package:movies_app/core/data/Model/favorite_move.dart';
import 'package:movies_app/core/domain/Entities/Move_Entity.dart';
import 'package:movies_app/core/domain/Entities/add_to_fav_usecase.dart';

part 'add_to_favorite_state.dart';

class AddToFavoriteCubit extends Cubit<AddToFavoriteState> {
  final AddToFavoriteUseCase addToFavoriteUseCase;
  AddToFavoriteCubit({required this.addToFavoriteUseCase})
    : super(AddToFavoriteInitial());

  Future<void> addToFavorite(MovieEntity movie) async {
    emit(AddToFavoriteLoading());

    final request = AddToFavoriteRequest(
      movieId: movie.id.toString(),
      name: movie.title,
      rating: movie.rating,
      imageURL: movie.posterImage,
      year: movie.year.toString(),
    );

    final result = await addToFavoriteUseCase.call(request);

    result.fold(
      (error) => emit(AddToFavoriteError(message: error)),
      (movie) => emit(AddToFavoriteSuccess(movie: movie)),
    );
  }
}
