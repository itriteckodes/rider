import 'package:driver/api/profile_api.dart';
import 'dart:convert';
import 'package:driver/helpers/auth.dart';
import 'package:driver/screens/profile/button.dart';
import 'package:driver/screens/profile/date_picker.dart';
import 'package:driver/screens/profile/image_input.dart';
import 'package:driver/screens/profile/select.dart';
import 'package:driver/screens/profile/text_area.dart';
import 'package:driver/screens/withdraw/fragments/account/input.dart';
import 'package:driver/screens/static/baloon.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  final cnicController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final regNoController = TextEditingController();
  final modelNoController = TextEditingController();
  final vehicleColorController = TextEditingController();
  final passwordController = TextEditingController();

  File profileImage;
  var profileImageString;

  File cnicFrontImage;
  var cnicFrontImageString;

  File cnicBackImage;
  var cnicBackImageString;

  File drivingLicense;
  var drivingLicenseString;

  String currentType;

  int selectedVehicle;

  imgFromCamera() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 50);
    setImage(image);
  }

  imgFromGallery() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    setImage(image);
  }

  setImage(image) {
    switch (currentType) {
      case "profileImage":
        profileImage = image;
        profileImageString = base64Encode(image.readAsBytesSync());
        break;
      case "cnicFront":
        cnicFrontImage = image;
        cnicFrontImageString = base64Encode(image.readAsBytesSync());
        break;
      case "cnicBack":
        cnicBackImage = image;
        cnicBackImageString = base64Encode(image.readAsBytesSync());
        break;
      case "drivingLicense":
        drivingLicense = image;
        drivingLicenseString = base64Encode(image.readAsBytesSync());
        break;
    }

    setState(() {});
  }

  onChangeVehicle(value) {
    setState(() {
      selectedVehicle = value;
    });
  }

  updateProfile() async {
    await ProfileApi.update(
      nameController.text,
      cnicController.text,
      emailController.text,
      passwordController.text,
      phoneController.text,
      dobController.text,
      cityController.text,
      addressController.text,
      selectedVehicle.toString(),
      regNoController.text,
      modelNoController.text,
      vehicleColorController.text,
      profileImageString,
      cnicFrontImageString,
      cnicBackImageString,
      drivingLicenseString,
    );

    initState();
  }

  @override
  void initState() {
    nameController.text = Auth.user().name;
    cnicController.text = Auth.user().cnic;
    emailController.text = Auth.user().email;
    phoneController.text = Auth.user().phone;
    dobController.text = Auth.user().dob;
    cityController.text = Auth.user().city;
    addressController.text = Auth.user().address;
    selectedVehicle = Auth.user().vehicleType;
    regNoController.text = Auth.user().vehicleRegNo;
    modelNoController.text = Auth.user().vehicleModelNo;
    vehicleColorController.text = Auth.user().vehicleColor;

    super.initState();
  }

  DateTime selectedDate = DateTime.now();

  _onSelectDate(controller) async {
    final DateTime picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        controller.text = selectedDate.toLocal().toString().split(' ')[0];
      });
  }

  showPicker(type) {
    currentType = type;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Clr.grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Baloon(context, color: Auth.user().approved ? Clr.green : Clr.red),
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
                          Text(
                            Auth.user().approved ? ' (Approved)' : ' (Pending)',
                            style: TextStyle(
                              color: Clr.white,
                              fontSize: Sizer.fontFive(),
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            if(Auth.user().comment != null)
                            Container(
                              width: MediaQuery.of(context).size.width * 0.80,
                              child: Text(Auth.user().comment ?? " "),
                            ),
                            SizedBox(height: 20),
                            Container(
                              child: InkWell(
                                onTap: () {
                                  showPicker('profileImage');
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 45,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(45)),
                                    child: profileImage != null
                                        ? Image.file(
                                            profileImage,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          )
                                        : Image.network(Auth.user().profileImage),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            input(context, nameController, 'Full name'),
                            SizedBox(height: 10),
                            input(context, cnicController, 'Cnic'),
                            SizedBox(height: 10),
                            input(context, emailController, 'Email'),
                            SizedBox(height: 10),
                            input(context, passwordController, 'Password'),
                            SizedBox(height: 10),
                            input(context, phoneController, 'Phone'),
                            SizedBox(height: 10),
                            datePicker(context, selectedDate, _onSelectDate, dobController, 'Date Of Birth'),
                            SizedBox(height: 10),
                            input(context, cityController, 'City'),
                            SizedBox(height: 10),
                            textArea(context, addressController, 'Address'),
                            SizedBox(height: 10),
                            Text(
                              'Vehicle Details',
                              style: TextStyle(
                                fontSize: Sizer.fontSix(),
                                fontWeight: FontWeight.bold,
                                color: Clr.green
                              ),
                            ),
                            SizedBox(height: 10),
                            select(context, onChangeVehicle, selectedVehicle),
                            SizedBox(height: 10),
                            input(context, regNoController, 'Vehicle Reg No.'),
                            SizedBox(height: 10),
                            input(context, modelNoController, 'Vehicle Model'),
                            SizedBox(height: 10),
                            input(context, vehicleColorController, 'vehicle Color'),
                            SizedBox(height: 10),
                            imageInput(showPicker, 'cnicFront', cnicFrontImage, Auth.user().cnicFrontImage),
                            SizedBox(height: 10),
                            imageInput(showPicker, 'cnicBack', cnicBackImage, Auth.user().cnicBackImage),
                            SizedBox(height: 10),
                            imageInput(showPicker, 'drivingLicense', drivingLicense, Auth.user().dirvingLicense),
                            SizedBox(height: 10),
                            button(context, onPress: updateProfile),
                            SizedBox(height: 10),
                          ],
                        ),
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
