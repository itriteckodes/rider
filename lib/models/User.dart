import 'dart:convert';

class User {
  var name, email, phone, address, apiToken, firebaseToken, balance;
  var online;
  User(response) {
    var user = response['rider'];
    name = user['name'] ?? "";
    email = user['email'] ?? "";
    phone = user['phone'] ?? "";
    address = user['address'] ?? "";
    apiToken = user['api_token'] ?? "";
    firebaseToken = user['firebase_token'] ?? "";
    balance = user['balance'];
    online = user['online'];
  }

  @override
  String toString() {
    return 'name : ' + name + ' email :' + email + ' balance :' + balance.toString();
  }

  toJson() {
    return jsonEncode(this);
  }

  static fromJson(json) {
    var user = jsonDecode(json);
    return User(user);
  }
}
