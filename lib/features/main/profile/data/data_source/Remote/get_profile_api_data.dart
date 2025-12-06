import 'package:dio/dio.dart';
import 'package:movies_app/core/Errors/app_exception.dart';
import 'package:movies_app/core/resources/constanst_manager.dart';

import 'package:movies_app/features/main/profile/data/Model/Get_profile_ressponse.dart';
import 'package:movies_app/features/main/profile/data/data_source/Remote/get_profile_data.dart';

class GetProfileApiData implements GetProfileData {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  @override
  Future<Get_profile_ressponse> getProfileData({required String token}) async {
    try {
      final response = await dio.get(
        ApiConstants.profile,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
        ),
      );

      return Get_profile_ressponse.fromJson(response.data);
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
}
