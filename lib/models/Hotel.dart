class Hotel {
  var name, email;

  Hotel(hotel) {
    name = hotel['name'] ?? "";
    email = hotel['email'] ?? "";
  }

  @override
  String toString() {
    return 'name : ' + name + ' email:' + email;
  }
}
