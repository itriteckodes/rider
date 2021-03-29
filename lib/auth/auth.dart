import 'package:driver/models/Ram.dart';
import 'package:driver/models/User.dart';
import 'package:flutter_session/flutter_session.dart';

class Auth {
  static Future login(User user) async {
    Ram.user = user;
    // var session = FlutterSession();
    // session.set('user', user);
  }

  static check() {
    var session = FlutterSession();
    var user = session.get('user');
    if (user != null)
      return true;
    else
      return false;
  }

  static user() {
    // var session = FlutterSession();
    // return  session.get('user');
    return Ram.user;
  }

  static Future logout() async {
    Ram.user = null;
    // var session = FlutterSession();
    // session.set('user', null);
  }
}
