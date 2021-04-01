import 'dart:io';

import 'package:driver/api/profile_api.dart';
import 'package:driver/screens/withdraw/fragments/account/button.dart';
import 'package:driver/screens/withdraw/fragments/account/input.dart';
import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AccountFragment extends StatefulWidget {
  AccountFragment({Key key}) : super(key: key);

  @override
  _AccountFragmentState createState() => _AccountFragmentState();
}

class _AccountFragmentState extends State<AccountFragment> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();

  File _image;

  updateProfile() async {
    await ProfileApi.update(nameController.text, emailController.text, phoneController.text, addressController.text, passwordController.text);
  }

  imgFromCamera() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  imgFromGallery() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  showPicker(context) {
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Clr.white),
      height: MediaQuery.of(context).size.height * 0.76,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            width: 300,
            child: InkWell(
              onTap: () {
                showPicker(context);
              },
              child: _image != null
                  ? Image.file(
                      _image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    )
                  : Image.asset("lib/assets/images/user.png"),
            ),
          ),
          SizedBox(height: 10),
          DropdownButton(
            items: [
              DropdownMenuItem(value : 1, child: Text('Option no 1')),
              DropdownMenuItem(value : 1, child: Text('Option no 1')),
              DropdownMenuItem(value : 1, child: Text('Option no 1')),
              DropdownMenuItem(value : 1, child: Text('Option no 1')),
            ],
            onChanged: (_){},
          ),
          SizedBox(height: 10),
          input(context, nameController, 'Title'),
          SizedBox(height: 10),
          input(context, emailController, 'Account'),
          SizedBox(height: 10),
          
          button(context, 'Submit', onPress: () {}),
        ],
      ),
    );
  }
}
