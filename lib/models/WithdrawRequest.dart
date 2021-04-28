class WithdrawRequest {
  var id, amount, status,date, accountTitle, accountNumber,method, image;

  WithdrawRequest(request) {
    id = request['id'] ?? "";
    amount = request['amount'] ?? "";
    status = request['status'] ?? "";
    date = request['date'] ?? "";
    accountTitle = request['approve_withdraw_account']['title'] ?? "";
    accountNumber = request['approve_withdraw_account']['account_no'] ?? "";
    method = request['approve_withdraw_account']['method']['name'] ?? "";
    image = request['approve_withdraw_account']['method']['image'] ?? "";
  }

  @override
  String toString() {
    return 'id : ' + id + ' amount :' + amount;
  }

  getStatus() {
    switch (status) {
      case 0:
      return "Pending";
      case 1:
        return "Approved";
      case 2:
        return "Rejected";
    }
  }
}
