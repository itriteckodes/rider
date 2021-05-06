import 'package:driver/api/auth_api.dart';
import 'package:driver/models/Ram.dart';
import 'package:driver/models/User.dart';
import 'package:flutter_session/flutter_session.dart';

class Auth {
  static User user() {
    return Ram.user;
  }

  static Future login(user) async {
    Ram.user = user;
  }

  static Future save(email, password) async {
    var session = FlutterSession();
    session.set('email', email);
    session.set('password', password);
  }

  static oldEmail() async {
    var session = FlutterSession();
    return await session.get('email') ?? "";
  }
  
  static oldPassword() async {
    var session = FlutterSession();
    return await session.get('password') ?? "";
  }

  static check() async {
    var session = FlutterSession();
    return await AuthApi.secretLogin(await session.get('email'), await session.get('password'));
  }

  static Future logout() async {
    var session = FlutterSession();
    await session.set('password', "");
    Ram.user = null;
  }
}
