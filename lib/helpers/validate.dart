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
}
