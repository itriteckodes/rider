class WithdrawMethod {
  var id, name;

  WithdrawMethod(user) {
    id = user['id'] ?? "";
    name = user['name'] ?? "";
  }

  @override
  String toString() {
    return 'id : ' + id + ' name:' + name;
  }

}
