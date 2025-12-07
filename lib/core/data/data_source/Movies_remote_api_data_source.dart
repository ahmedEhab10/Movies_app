import 'package:dio/dio.dart';
import 'package:movies_app/core/Errors/app_exception.dart';
import 'package:movies_app/core/data/Model/AddToFavoriteRequest.dart';
import 'package:movies_app/core/data/Model/Movies_ressponse.dart';
import 'package:movies_app/core/data/Model/add_to_favorite_response.dart';
import 'package:movies_app/core/data/data_source/Movies_remote_data_source.dart';
import 'package:movies_app/core/resources/constanst_manager.dart';

class MoviesRemoteApiDataSource implements MoviesRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl2));
  Dio dio2 = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  @override
  Future<Movies_ressponse> getMovies([int? limit]) async {
    try {
      final response = await dio.get(
        ApiConstants.allMovies,
        queryParameters: {"limit": limit},
      );

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

  @override
  Future<Movies_ressponse> getMoviesBygenre({String? genre}) async {
    try {
      final response = await dio.get(
        ApiConstants.allMovies,
        queryParameters: {"genre": genre},
      );

      return Movies_ressponse.fromJson(response.data);
    } catch (e) {
      String? errorMessage;

      if (e is DioException) {
        errorMessage = e.message ?? "Unexpected Error, Please try again";
      } else {
        errorMessage = "Unexpected Error, Please try again";
      }

      throw RemoteAppException(message: errorMessage);
    }
  }

  @override
  Future<AddToFavoriteResponse> addToFavorite({
    required AddToFavoriteRequest request,
    required String token,
  }) async {
    try {
      final response = await dio2.post(
        ApiConstants.addtofavorites,
        data: request.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      return AddToFavoriteResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw RemoteAppException(message: e.message ?? "Unexpected Error");
    }
  }
}
