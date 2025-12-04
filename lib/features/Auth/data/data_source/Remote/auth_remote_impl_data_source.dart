import 'package:dio/dio.dart';
import 'package:movies_app/core/Errors/app_exception.dart';
import 'package:movies_app/core/resources/constanst_manager.dart';
import 'package:movies_app/features/Auth/data/Models/Login_request.dart';
import 'package:movies_app/features/Auth/data/Models/Login_ressponde.dart';
import 'package:movies_app/features/Auth/data/Models/Register_request.dart';
import 'package:movies_app/features/Auth/data/Models/Register_ressponse.dart';
import 'package:movies_app/features/Auth/data/data_source/Remote/auth_remote_data_source.dart';

class AuthRemoteImplDataSource extends AuthRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  @override
  Future<Register_ressponse> regiser(RegisterRequest registerRequest) async {
    try {
      final response = await dio.post(
        ApiConstants.register,
        data: registerRequest.toJson(),
      );
      return Register_ressponse.fromJson(response.data);
    } on DioException catch (e) {
      String errorMessage = "Failed To Register";

      final data = e.response?.data;

      if (data != null && data is Map<String, dynamic>) {
        final message = data['message'];

        // ✅ CASE 1: message is String
        if (message is String) {
          errorMessage = message;
        }
        // ✅ CASE 2: message is List<String>
        else if (message is List) {
          errorMessage = message.join('\n');
        }
      } else {
        errorMessage = e.message ?? errorMessage;
      }

      throw RemoteAppException(message: errorMessage);
    } catch (e) {
      throw RemoteAppException(message: "Unexpected Error, Please try again");
    }
  }

  @override
  Future<Login_ressponse> login(Login_request loginRequest) async {
    try {
      final response = await dio.post(
        ApiConstants.Login,
        data: loginRequest.toJson(),
      );

      return Login_ressponse.fromJson(response.data);
    } on DioException catch (e) {
      String errorMessage = "Failed To Register";

      final data = e.response?.data;

      if (data != null && data is Map<String, dynamic>) {
        final message = data['message'];

        if (message is String) {
          errorMessage = message;
        } else if (message is List) {
          errorMessage = message.join('\n');
        }
      } else {
        errorMessage = e.message ?? errorMessage;
      }

      throw RemoteAppException(message: errorMessage);
    } catch (e) {
      throw RemoteAppException(message: "Unexpected Error, Please try again");
    }
  }
}
