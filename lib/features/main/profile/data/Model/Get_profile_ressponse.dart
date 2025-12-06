import 'package:movies_app/features/main/profile/data/Model/user_profile_data.dart';

class Get_profile_ressponse {
  final String? message;
  final UserProfileData? userProfileData;

  Get_profile_ressponse({this.message, this.userProfileData});

  factory Get_profile_ressponse.fromJson(Map<String, dynamic> json) {
    return Get_profile_ressponse(
      message: json['message'],
      userProfileData: json['data'] == null
          ? null
          : UserProfileData.fromJson(json['data']),
    );
  }
}
