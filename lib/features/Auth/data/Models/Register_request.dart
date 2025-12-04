class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
  final int avaterId;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.avaterId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    data['avaterId'] = this.avaterId;
    data['phone'] = this.phone;
    return data;
  }
} 





// "name":"amr mustafa",
//     "email":"ahmedhobaa1@gmail.com",
//     "password":"Ahmed@12345",
//     "confirmPassword":"Ahmed@12345",
//     "phone":"+201141209334",
//     "avaterId":1