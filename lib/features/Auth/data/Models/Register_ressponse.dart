import 'dart:developer';

import 'package:movies_app/features/Auth/data/Models/User_Data.dart';

class Register_ressponse {
  String? message;
  UserData? user_data;

  Register_ressponse({this.message, this.user_data});

  Register_ressponse.fromJson(Map<String, dynamic> json) {
    final msg = json['message'];
    if (msg is String) {
      message = msg;
    } else if (msg is List) {
      message = msg.join('\n');
      log(
        'there is the Error in Register_ressponse',
      ); // كل عناصر اللستة في سطر واحد
    }
    user_data = json['data'] != null
        ? new UserData.fromJson(json['data'])
        : null;
  }
}
