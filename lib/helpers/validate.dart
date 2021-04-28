import 'package:driver/auth/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Validate {
  static login(emailController, passwordController){
    if (emailController.text == "") {
      Fluttertoast.showToast(msg: "Please enter email");
      return false;
    }
    if (passwordController.text == "") {
      Fluttertoast.showToast(msg: "Please enter password");
      return false;
    }
    return true;
  }
  
  static addAccount(titleController, accountNumberController, imageString){
    if (imageString == null) {
      Fluttertoast.showToast(msg: "Please select proof image");
      return false;
    }
    if (titleController.text == "") {
      Fluttertoast.showToast(msg: "Please enter title");
      return false;
    }
    if (accountNumberController.text == "") {
      Fluttertoast.showToast(msg: "Please enter account no");
      return false;
    }
    return true;
  }
  
  static withdrawRequest(amount){
    if (int.parse(amount) > Auth.user().balance) {
      Fluttertoast.showToast(msg: "You don't have enough balance");
      return false;
    }

    return true;
  }
}
