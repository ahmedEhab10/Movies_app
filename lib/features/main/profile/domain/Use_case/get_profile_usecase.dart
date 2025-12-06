import 'package:dartz/dartz.dart';
import 'package:movies_app/features/main/profile/domain/Entities/User_Entity.dart';
import 'package:movies_app/features/main/profile/domain/repository/get_profile_repo.dart';

class GetProfileUsecase {
  GetProfileRepo getProfileRepo;

  GetProfileUsecase({required this.getProfileRepo});
  Future<Either<String, UserProfileEntity>> call() {
    return getProfileRepo.getProfileDatarepo();
  }
}
