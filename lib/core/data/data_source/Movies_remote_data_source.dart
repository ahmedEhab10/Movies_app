import 'package:movies_app/core/data/Model/AddToFavoriteRequest.dart';
import 'package:movies_app/core/data/Model/Movies_ressponse.dart';
import 'package:movies_app/core/data/Model/add_to_favorite_response.dart';

abstract class MoviesRemoteDataSource {
  Future<Movies_ressponse> getMovies([int? limit]);
  Future<Movies_ressponse> getMoviesBygenre({String? genre});

  Future<AddToFavoriteResponse> addToFavorite({
    required AddToFavoriteRequest request,
    required String token,
  });
  Future<Movies_ressponse> getMovieSuggestions({required int moveid});
}
