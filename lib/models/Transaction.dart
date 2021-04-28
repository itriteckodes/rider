class Transacation {
  var id,date, amount, type, openingBalance, closingBalance, description, method, status;

  Transacation(transaction) {
    id = transaction['id'] ?? "";
    date = transaction['date'] ?? "";
    type = transaction['nature'] ?? "";
    amount = transaction['amount'] ?? "";
    openingBalance = transaction['opening'] ?? "";
    closingBalance = transaction['closing'] ?? "";
    description = transaction['description'] ?? "";
  }

  @override
  String toString() {
    return 'id : ' + id + ' description:' + description;
  }
}
