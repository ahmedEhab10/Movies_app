import 'package:movies_app/core/data/Model/favorite_move.dart';

class AddToFavoriteResponse {
  final String message;
  final FavoriteMovieModel favoriteMovie;

  AddToFavoriteResponse({required this.message, required this.favoriteMovie});

  factory AddToFavoriteResponse.fromJson(Map<String, dynamic> json) {
    return AddToFavoriteResponse(
      message: json['message'],
      favoriteMovie: FavoriteMovieModel.fromJson(json['data']),
    );
  }
}
