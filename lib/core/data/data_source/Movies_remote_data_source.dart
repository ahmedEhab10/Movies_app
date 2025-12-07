import 'package:movies_app/core/data/Model/Movies_ressponse.dart';

abstract class MoviesRemoteDataSource {
  Future<Movies_ressponse> getMovies();
  Future<Movies_ressponse> getMoviesBygenre({String? genre});
}
