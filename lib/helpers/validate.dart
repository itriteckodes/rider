import 'package:driver/helpers/auth.dart';
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
  
  static register(nameController, cnicController, genderController, phoneController, emailController, passwordController, confirmPasswordController){
    if (nameController.text == "") {
      Fluttertoast.showToast(msg: "Please enter name");
      return false;
    }
    
    if (cnicController.text.length != 13) {
      Fluttertoast.showToast(msg: "Cnic must be 13 digits");
      return false;
    }
    
    if (cnicController.text == "") {
      Fluttertoast.showToast(msg: "Please enter phone");
      return false;
    }
    
    if (emailController.text == "") {
      Fluttertoast.showToast(msg: "Please enter email");
      return false;
    }
    if (passwordController.text == "") {
      Fluttertoast.showToast(msg: "Please enter password");
      return false;
    }
    if (confirmPasswordController.text == "") {
      Fluttertoast.showToast(msg: "Please confirm password");
      return false;
    }
    if (confirmPasswordController.text != passwordController.text) {
      Fluttertoast.showToast(msg: "Please enter same password");
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
  
  static depositRequest(amountController, transactionIdController){
   if (amountController.text == "") {
      Fluttertoast.showToast(msg: "Please enter amount");
      return false;
    }
    if (transactionIdController.text == "") {
      Fluttertoast.showToast(msg: "Please enter TransactionId");
      return false;
    }

    return true;
  }
}
