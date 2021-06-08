import 'package:driver/api/auth_api.dart';
import 'package:driver/helpers/auth.dart';
import 'package:driver/helpers/validate.dart';
import 'package:driver/screens/login/button.dart';
import 'package:driver/screens/login/forget.dart';
import 'package:driver/screens/login/input.dart';
import 'package:driver/screens/login/main_heading.dart';
import 'package:driver/screens/login/sub_heading.dart';
import 'package:driver/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  onPressLogin(context) async {
    FocusScope.of(context).unfocus();
    if (Validate.login(emailController, passwordController)) {
      if (await AuthApi.login(emailController.text, passwordController.text)) {
        Auth.save(emailController.text, passwordController.text);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/login_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
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
                  SizedBox(
                    height: 20,
                  ),
                  forget(onTap: () {
                    Navigator.popAndPushNamed(context, 'register');
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
