import 'package:movies_app/features/main/profile/data/Model/Get_profile_ressponse.dart';

abstract class GetProfileData {
  Future<Get_profile_ressponse> getProfileData({required String token});
}
