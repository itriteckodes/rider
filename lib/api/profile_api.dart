import 'package:driver/api/api.dart';
import 'package:driver/helpers/auth.dart';
import 'package:driver/models/User.dart';
import 'package:driver/values/Strings.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileApi {
  static update(name, cnic, email, password, phone, dob, city, address, vehicleType, regNo, modelNo, color, profileImage, cnicFrontImage, cnicBackImage, drivingLicense) async {
    EasyLoading.show();

   var url = Strings.baseUrl + 'profile/update';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {
      'name' : name,
      'id_card_no' : cnic,
      'email' : email,
      'password' : password != ""?password : null,
      'phone' : phone,
      'dob' : dob,
      'city' : city,
      'address' : address,
      'vehicle_type' : vehicleType,
      'vehicle_reg_no' : regNo,
      'vehicle_model_no' : modelNo,
      'vehicle_color' : color,
      'image' : profileImage,
      'cnicfront' : cnicFrontImage,
      'cnicback' : cnicBackImage,
      'driving_license' : drivingLicense,
      };

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();
    if (!response['error']) {
      var user = User(response);
      Auth.login(user);
      Fluttertoast.showToast(msg: 'profile updated');
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
}
