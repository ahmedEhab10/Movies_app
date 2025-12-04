import 'package:dartz/dartz.dart';
import 'package:movies_app/core/Errors/app_exception.dart';
import 'package:movies_app/features/Auth/data/Models/Login_request.dart';
import 'package:movies_app/features/Auth/data/Models/Login_ressponde.dart';
import 'package:movies_app/features/Auth/data/Models/Register_request.dart';
import 'package:movies_app/features/Auth/data/Models/User_Data.dart';
import 'package:movies_app/features/Auth/data/data_source/Local/auth_local_data_source.dart';
import 'package:movies_app/features/Auth/data/data_source/Remote/auth_remote_data_source.dart';
import 'package:movies_app/features/Auth/data/data_source/Remote/auth_remote_impl_data_source.dart';
import 'package:movies_app/features/Auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;
  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<String, UserData>> regiser(
    RegisterRequest registerRequest,
  ) async {
    try {
      final response = await authRemoteDataSource.regiser(registerRequest);
      return Right(response.user_data!);
    } on RemoteAppException catch (e) {
      // هنا بناخد الرسالة الحقيقية
      return Left(e.message);
    } catch (e) {
      // أي Exception تانية
      return Left("Unexpected error, please try again");
    }
  }

  @override
  Future<Either<String, Login_ressponse>> login(
    Login_request loginRequest,
  ) async {
    try {
      final response = await authRemoteDataSource.login(loginRequest);
      authLocalDataSource.saveToken(response.data!);
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
