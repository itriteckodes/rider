import 'dart:convert';

class Customer {
  var id, name, email, address;

  Customer(user) {
    id = user['name'] ?? "";
    name = user['name'] ?? "";
    email = user['email'] ?? "";
    address = user['address'] ?? "";
  }

  @override
  String toString() {
    return 'name : ' + name + ' email:' + email;
  }

  toJson() {
    return jsonEncode(this);
  }

  static fromJson(json) {
    var user = jsonDecode(json);
    return Customer(user);
  }
}
