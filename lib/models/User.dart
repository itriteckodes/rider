import 'dart:convert';

class User {
  var name, email, apiToken, firebaseToken;

  User(user) {
    name = user['name'] ?? "";
    email = user['email'] ?? "";
    apiToken = user['api_token'] ?? "";
    firebaseToken = user['firebase_token'] ?? "";
  }

  @override
  String toString() {
    return 'name : ' + name + ' email:' + email + ' apiToken:' + apiToken;
  }

  toJson() {
    return jsonEncode(this);
  }

  static fromJson(json) {
    var user = jsonDecode(json);
    return User(user);
  }
}
