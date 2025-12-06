import 'package:dartz/dartz.dart';
import 'package:movies_app/features/main/profile/domain/Entities/User_Entity.dart';

abstract class GetProfileRepo {
  Future<Either<String, UserProfileEntity>> getProfileDatarepo();
}
