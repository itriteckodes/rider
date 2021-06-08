class DepositMethod {
  var id, title, number, image, method;

  DepositMethod(depositMethod) {
    id = depositMethod['id'] ?? "";
    title = depositMethod['title'] ?? "Javed Khan";
    number = depositMethod['account_no'] ?? "84654541";
    image = depositMethod['image'] ?? "https://gojak.app/images/gateway/easypaisa.png";
    method = depositMethod['name'] ?? "";
  }

  @override
  String toString() {
    return 'title : ' + title + ' number:' + number;
  }
}
