class Account {
  var id, title, number, image, description, method, status;

  Account(account) {
    id = account['name'] ?? "";
    title = account['title'] ?? "";
    number = account['account_no'] ?? "";
    image = account['method']['image'] ?? "";
    method = account['method']['name'] ?? "";
    description = account['description'] ?? "";
    status = account['status'] ?? "";
  }

  @override
  String toString() {
    return 'title : ' + title + ' number:' + number;
  }

  getStatus() {
    switch (status) {
      case "0":
      return "Pending";
      case "1":
        return "Approved";
      case "2":
        return "Rejected";
    }
  }
}
