import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/domain/Entities/Move_Entity.dart';
import 'package:movies_app/core/domain/Use_case/get_movies_by_genra_usecase.dart';

part 'get_movies_by_genra_state.dart';

class GetMoviesByGenraCubit extends Cubit<GetMoviesByGenraState> {
  GetMoviesByGenraUsecase getMoviesByGenraUsecase;

  GetMoviesByGenraCubit({required this.getMoviesByGenraUsecase})
    : super(GetMoviesByGenraInitial());

  Future<void> getMovies({String? genre}) async {
    emit(GetMoviesByGenraLoading());
    var result = await getMoviesByGenraUsecase.call(genre!);
    result.fold(
      (errormassage) => emit(GetMoviesByGenraError(errormassage)),
      (moves) => emit(GetMoviesByGenraSuccess(movies: moves)),
    );
  }
}
