part of 'add_to_favorite_cubit.dart';

@immutable
sealed class AddToFavoriteState {}

final class AddToFavoriteInitial extends AddToFavoriteState {}

final class AddToFavoriteLoading extends AddToFavoriteState {}

final class AddToFavoriteSuccess extends AddToFavoriteState {
  final FavoriteMovieModel movie;

  AddToFavoriteSuccess({required this.movie});
}

final class AddToFavoriteError extends AddToFavoriteState {
  final String message;

  AddToFavoriteError({required this.message});
}
