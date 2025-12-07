import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/domain/Entities/Move_Entity.dart';
import 'package:movies_app/core/domain/Use_case/GetMovieSuggestionsUsecase%20.dart';

part 'suggestions_state.dart';

class SuggestionsCubit extends Cubit<SuggestionsState> {
  SuggestionsCubit({required this.usecase}) : super(SuggestionsInitial());

  final GetMovieSuggestionsUsecase usecase;

  void getSuggestions({required int movieId}) async {
    emit(SuggestionsLoading());

    final result = await usecase(movieId);

    result.fold(
      (error) => emit(SuggestionsError(error)),
      (movies) => emit(SuggestionsSuccess(movies)),
    );
  }
}
