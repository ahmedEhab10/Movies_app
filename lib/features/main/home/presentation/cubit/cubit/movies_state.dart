part of 'movies_cubit.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MoviesLoading extends MoviesState {}

final class MoviesSuccess extends MoviesState {
  List<MovieEntity> movies;

  MoviesSuccess({required this.movies});
}

final class MoviesError extends MoviesState {
  String ErrorMessage;

  MoviesError({required this.ErrorMessage});
}
