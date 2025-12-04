import 'package:movies_app/features/Auth/data/Models/Login_request.dart';
import 'package:movies_app/features/Auth/data/Models/Login_ressponde.dart';
import 'package:movies_app/features/Auth/data/Models/Register_request.dart';
import 'package:movies_app/features/Auth/data/Models/Register_ressponse.dart';

abstract class AuthRemoteDataSource {
  Future<Register_ressponse> regiser(RegisterRequest registerRequest);
  Future<Login_ressponse> login(Login_request loginRequest);
}
