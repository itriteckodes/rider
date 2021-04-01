import 'package:driver/api/profile_api.dart';
import 'package:driver/auth/auth.dart';
import 'package:driver/screens/withdraw/fragments/account/button.dart';
import 'package:driver/screens/withdraw/fragments/account/input.dart';
import 'package:driver/screens/static/baloon.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();

  updateProfile() async {
    await ProfileApi.update(nameController.text, emailController.text, phoneController.text, addressController.text, passwordController.text);
    
  }

  @override
  void initState() {
    nameController.text = Auth.user().name;
    emailController.text = Auth.user().email;
    phoneController.text = Auth.user().phone;
    addressController.text = Auth.user().address;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Clr.grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Baloon(context),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0, right: 10.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                FontAwesomeIcons.chevronCircleLeft,
                                size: Sizer.fontThree(),
                                color: Clr.white,
                              ),
                            ),
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                              color: Clr.white,
                              fontSize: Sizer.fontTwo(),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Clr.white),
                      height: MediaQuery.of(context).size.height * 0.76,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Positioned(
                            top: 150,
                            left: 20,
                            right: 20,
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 45,
                              child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(45)), child: Image.asset("lib/assets/images/user.png")),
                            ),
                          ),
                          SizedBox(height: 10),
                          input(context, nameController, 'Full name'),
                          SizedBox(height: 10),
                          input(context, emailController, 'Email'),
                          SizedBox(height: 10),
                          input(context, phoneController, 'Phone'),
                          SizedBox(height: 10),
                          input(context, addressController, 'Address'),
                          SizedBox(height: 10),
                          input(context, passwordController, 'Password', obscure: true),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                button(context,'Update', onPress : updateProfile),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 