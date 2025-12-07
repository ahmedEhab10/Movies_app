part of 'get_movies_by_genra_cubit.dart';

@immutable
sealed class GetMoviesByGenraState {}

final class GetMoviesByGenraInitial extends GetMoviesByGenraState {}

final class GetMoviesByGenraLoading extends GetMoviesByGenraState {}

final class GetMoviesByGenraError extends GetMoviesByGenraState {
  String message;

  GetMoviesByGenraError(this.message);
}

final class GetMoviesByGenraSuccess extends GetMoviesByGenraState {
  List<MovieEntity> movies;
  GetMoviesByGenraSuccess({required this.movies});
}
