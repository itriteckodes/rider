import 'package:driver/api/auth_api.dart';
import 'package:driver/helpers/auth.dart';
import 'package:driver/helpers/validate.dart';
import 'package:driver/screens/register/select.dart';
import 'package:driver/screens/register/button.dart';
import 'package:driver/screens/register/already_registered.dart';
import 'package:driver/screens/register/input.dart';
import 'package:driver/screens/register/main_heading.dart';
import 'package:driver/screens/register/sub_heading.dart';
import 'package:driver/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  var selectedGender = "male";

  final nameController = TextEditingController();
  final cnicController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  onPressRegister(context) async {
    FocusScope.of(context).unfocus();
    if (Validate.register(nameController, cnicController, genderController, phoneController, emailController, passwordController, confirmPasswordController)) {
      if (await AuthApi.register(nameController.text, cnicController.text, genderController.text, phoneController.text, emailController.text, passwordController.text, confirmPasswordController.text)) {
        Auth.save(emailController.text, passwordController.text);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }
  }

   onChangeGender(value) {
      setState(() {
        selectedGender = value;
        genderController.text = value;
      });
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
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainHeading(),
                        SubHeading(),
                      ],
                    ),
                  ),
                  
                  Input(context, nameController, 'Name'),

                  SizedBox(
                    height: 25,
                  ),

                  Input(context, cnicController, 'Cnic'),

                  SizedBox(
                    height: 25,
                  ),
                  
                  select(context, onChangeGender, selectedGender),

                  SizedBox(
                    height: 25,
                  ),

                  Input(context, phoneController, 'Phone'),
                  SizedBox(
                    height: 25,
                  ),
                  Input(context, emailController, 'Email'),

                  SizedBox(
                    height: 25,
                  ),

                  Input(context, passwordController, 'Password', obscure: true),

                  SizedBox(
                    height: 20,
                  ),

                  Input(context, confirmPasswordController, 'Confirm Password', obscure: true),

                  SizedBox(
                    height: 20,
                  ),

                  Button(context, onPressRegister, 'Register'),

                  SizedBox(
                    height: 20,
                  ),

                  alreadyRegistered(onTap: () {
                    Navigator.popAndPushNamed(context, 'login');
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
