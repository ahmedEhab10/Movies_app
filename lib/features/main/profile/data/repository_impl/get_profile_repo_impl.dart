import 'package:dartz/dartz.dart';
import 'package:movies_app/core/Errors/app_exception.dart';
import 'package:movies_app/features/Auth/data/data_source/Local/auth_local_impl_data_source.dart';
import 'package:movies_app/features/main/profile/data/data_source/Remote/get_profile_data.dart';
import 'package:movies_app/features/main/profile/domain/Entities/User_Entity.dart';
import 'package:movies_app/features/main/profile/domain/repository/get_profile_repo.dart';

class GetProfileRepoImpl implements GetProfileRepo {
  final GetProfileData getProfileData;

  GetProfileRepoImpl({required this.getProfileData});
  @override
  Future<Either<String, UserProfileEntity>> getProfileDatarepo() async {
    try {
      final token = await AuthLocalImplDataSource().getToken();
      if (token == null || token.isEmpty) {
        return Left("Token not found, please login again");
      }

      final response = await getProfileData.getProfileData(token: token);
      return Right(response.userProfileData!.toUserProfileEntity());
    } on RemoteAppException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left("Unexpected error, please try again");
    }
  }
}
