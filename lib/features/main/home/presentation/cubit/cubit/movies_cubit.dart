import 'package:bloc/bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/domain/Entities/Move_Entity.dart';
import 'package:movies_app/core/domain/Use_case/get_movies_usecase.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.getMoviesUsecase}) : super(MoviesInitial());
  GetMoviesUsecase getMoviesUsecase;

  Future<void> getMovies([int? limit]) async {
    emit(MoviesLoading());
    var result = await getMoviesUsecase.call(limit);
    result.fold(
      (errormassage) => emit(MoviesError(ErrorMessage: errormassage)),
      (moves) => emit(MoviesSuccess(movies: moves)),
    );
  }
}
