import 'package:driver/models/DepositMethod.dart';

class DepositRequest {
  var id, transactionId, amount, status,date;
  DepositMethod method;

  DepositRequest(depositRequest) {
    id = depositRequest['id'] ?? "";
    transactionId = depositRequest['TID'] ?? "";
    amount = depositRequest['amount'] ?? "";
    status = depositRequest['status'] ?? "";
    date = depositRequest['date'] ?? "";
    method = DepositMethod(depositRequest['deposit_method']) ?? "";
  }

  String getStatus() {
    switch (status) {
      case 0:
        return "Pending";
      case 1:
        return "Accepted";
      case 2:
        return "Rejected";
      default:
        return "";
    }
  }
}
