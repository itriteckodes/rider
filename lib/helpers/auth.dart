import 'package:driver/Services/online.dart';
import 'package:driver/api/auth_api.dart';
import 'package:driver/models/Ram.dart';
import 'package:driver/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static User user() {
    return Ram.user;
  }

  static Future login(user) async {
    Ram.user = user;
  }

  static Future save(email, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('password', password);
  }

  static oldEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email') ?? "";
  }

  static oldPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('password') ?? "";
  }

  static check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email');
    String password = prefs.getString('password');
    if (email == null || password == null) return false;
    return await AuthApi.secretLogin(email, password);
  }

  static Future logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('password');
    Ram.user = null;
    OnlineService.cancel();
  }
}
