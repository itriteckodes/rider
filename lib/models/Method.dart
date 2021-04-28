class Method {
  var id, name, image;

  Method(method) {
    id = method['id'] ?? "";
    name = method['name'] ?? "";
    image = method['image'] ?? "";
  }

  @override
  String toString() {
    return 'id : ' + id + ' name:' + name;
  }

}
