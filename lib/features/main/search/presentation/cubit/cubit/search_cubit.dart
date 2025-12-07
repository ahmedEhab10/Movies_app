import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/domain/Entities/Move_Entity.dart';
import 'package:movies_app/core/domain/Use_case/get_movies_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.getMoviesUsecase}) : super(SearchInitial());

  final GetMoviesUsecase getMoviesUsecase;

  List<MovieEntity> allMovies = [];

  Future<void> loadAllMovies() async {
    emit(SearchLoading());

    final result = await getMoviesUsecase.call();

    result.fold((error) => emit(SearchError(error)), (movies) {
      allMovies = movies;
      emit(SearchEmpty());
    });
  }

  void search(String query) {
    if (query.isEmpty) {
      emit(SearchEmpty());
      return;
    }

    final result = allMovies.where((movie) {
      return movie.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (result.isEmpty) {
      emit(SearchNoResult());
    } else {
      emit(SearchSuccess(result));
    }
  }
}
