import 'package:movies_app/features/main/profile/domain/Entities/User_Entity.dart';

class UserData {
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserData({
    this.email,
    this.password,
    this.name,
    this.phone,
    this.avaterId,
    this.sId,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    avaterId = json['avaterId'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
