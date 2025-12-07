import 'package:movies_app/core/resources/constanst_manager.dart';
import 'package:movies_app/features/Auth/data/data_source/Local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalImplDataSource implements AuthLocalDataSource {
  @override
  Future<String> getToken() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(CachConstants.token)!;
  }

  @override
  Future<void> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(CachConstants.token, token);
  }

  @override
  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(CachConstants.token);
  }
}
