import 'package:movies_app/features/main/profile/domain/Entities/User_Entity.dart';

class UserProfileData {
  final String? sId;
  final String? email;
  final String? password;
  final String? name;
  final String? phone;
  final int? avaterId;
  final String? createdAt;
  final String? updatedAt;
  final int? iV;

  UserProfileData({
    this.sId,
    this.email,
    this.password,
    this.name,
    this.phone,
    this.avaterId,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  factory UserProfileData.fromJson(Map<String, dynamic> json) {
    return UserProfileData(
      sId: json['_id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      phone: json['phone'],
      avaterId: json['avaterId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
    );
  }
  UserProfileEntity toUserProfileEntity() => UserProfileEntity(
    sId: sId,
    email: email,
    password: password,
    name: name,
    phone: phone,
    avaterId: avaterId,
  );
}
