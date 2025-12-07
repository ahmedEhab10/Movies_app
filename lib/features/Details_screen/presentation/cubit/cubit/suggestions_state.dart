part of 'suggestions_cubit.dart';

@immutable
sealed class SuggestionsState {}

final class SuggestionsInitial extends SuggestionsState {}

class SuggestionsLoading extends SuggestionsState {}

class SuggestionsSuccess extends SuggestionsState {
  final List<MovieEntity> movies;
  SuggestionsSuccess(this.movies);
}

class SuggestionsError extends SuggestionsState {
  final String message;
  SuggestionsError(this.message);
}
