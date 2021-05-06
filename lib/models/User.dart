class User {
  var name, email, phone, address, apiToken, firebaseToken, balance, allowedGosit, allowedRide, allowedFood, allowedParcel;
  bool approved;
  var vehicleType;
  var cnic;
  var online;
  var dob;
  var city;
  var comment;
  var vehicleRegNo, vehicleModelNo, vehicleColor;
  String profileImage;
  String cnicFrontImage;
  String cnicBackImage;
  String dirvingLicense;
  User(response) {
    var user = response['rider'];
    name = user['name'] ?? "";
    cnic = user['id_card_no'] ?? "";
    email = user['email'] ?? "";
    phone = user['phone'] ?? "";
    dob = user['dob'] ?? "";
    city = user['city'] ?? "";
    address = user['address'] ?? "";
    apiToken = user['api_token'] ?? "";
    firebaseToken = user['firebase_token'] ?? "";
    balance = user['balance'];
    online = user['online'];
    allowedGosit = user['allowed_gosit'];
    allowedRide = user['allowed_passenger'];
    allowedFood = user['allowed_food'];
    allowedParcel = user['allowed_parcel'];
    approved = user['approve'];
    vehicleType = user['vehicle_type'];
    vehicleRegNo = user['vehicle_reg_no'];
    vehicleModelNo = user['vehicle_model_no'];
    vehicleColor = user['vehicle_color'];
    profileImage = user['image'];
    cnicFrontImage = user['cnicfront'];
    cnicBackImage = user['cnicback'];
    dirvingLicense = user['driving_license'];
    comment = user['comment'];
  }

  @override
  String toString() {
    return 'name : ' + name + ' email :' + email + ' balance :' + balance.toString();
  }
}