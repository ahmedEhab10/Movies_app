import 'package:dartz/dartz.dart';
import 'package:movies_app/features/Auth/data/Models/Login_request.dart';
import 'package:movies_app/features/Auth/data/Models/Login_ressponde.dart';
import 'package:movies_app/features/Auth/data/Models/Register_request.dart';
import 'package:movies_app/features/Auth/data/Models/User_Data.dart';

abstract class AuthRepository {
  Future<Either<String, UserData>> regiser(RegisterRequest registerRequest);

  Future<Either<String, Login_ressponse>> login(Login_request loginRequest);
}
