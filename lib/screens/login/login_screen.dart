import 'package:driver/helpers/validate.dart';
import 'package:driver/screens/login/button.dart';
import 'package:driver/screens/login/input.dart';
import 'package:driver/screens/login/main_heading.dart';
import 'package:driver/screens/login/sub_heading.dart';
import 'package:driver/api/api.dart';
import 'package:driver/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  onPressLogin(context) async {
    if (Validate.login(emailController, passwordController)) {
      var loggedIn = await Api.login(emailController.text, passwordController.text);

      if (loggedIn)
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      else
        Fluttertoast.showToast(msg: "Incorrect email or password");
    }
  }

  @override
  Widget build(BuildContext context) {
    EasyLoading.dismiss();

    emailController.text = "rider1@mail.com";
    passwordController.text = "1234";

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/login_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainHeading(),
                        SubHeading(),
                      ],
                    ),
                  ),
                  Input(context, emailController, 'Email'),
                  SizedBox(
                    height: 25,
                  ),
                  Input(context, passwordController, 'Password', obscure: true),
                  SizedBox(
                    height: 20,
                  ),
                  Button(context, onPressLogin, 'SIGN IN'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
