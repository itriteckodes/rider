class Wallet {
  
  var balance;
  var lifeTimeEarning;
  var totalPassengers;
  var ordersDelivered;

  Wallet(wallet) {
      balance = wallet['balance'];
      lifeTimeEarning = wallet['earning'];
      totalPassengers = wallet['TotalPassengerOrder'];
      ordersDelivered = wallet['OrderDelivered'];
  }

  @override
  String toString() {
    return 'title : ' + balance + ' number:' + lifeTimeEarning;
  }
}
