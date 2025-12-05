import 'package:dio/dio.dart';
import 'package:movies_app/core/Errors/app_exception.dart';
import 'package:movies_app/core/data/Model/Movies_ressponse.dart';
import 'package:movies_app/core/data/data_source/Movies_remote_data_source.dart';
import 'package:movies_app/core/resources/constanst_manager.dart';

class MoviesRemoteApiDataSource implements MoviesRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl2));
  @override
  Future<Movies_ressponse> getMovies() async {
    try {
      final response = await dio.get(ApiConstants.allMovies);

      return Movies_ressponse.fromJson(response.data);
    } catch (e) {
      String errorMessage;

      if (e is DioException) {
        errorMessage = e.message ?? "Unexpected Error, Please try again";
      } else {
        errorMessage = "Unexpected Error, Please try again";
      }

      throw RemoteAppException(message: errorMessage);
    }
  }
}
