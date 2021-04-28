import 'dart:convert';
import 'dart:io';
import 'package:driver/api/withdraw_api.dart';
import 'package:driver/helpers/validate.dart';
import 'package:driver/screens/withdraw/fragments/account/button.dart';
import 'package:driver/screens/withdraw/fragments/account/input.dart';
import 'package:driver/screens/withdraw/fragments/account/text_area.dart';
import 'package:driver/values/Clr.dart';
import 'package:driver/values/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

class AccountFragment extends StatefulWidget {
  AccountFragment({Key key, @required this.switchFragment}) : super(key: key);

  final switchFragment;
  @override
  _AccountFragmentState createState() => _AccountFragmentState();
}

class _AccountFragmentState extends State<AccountFragment> {
  final titleController = TextEditingController();
  final accountNoController = TextEditingController();
  final descriptionController = TextEditingController();

  File _image;
  var _imageString;
  var _selectedMethod;
  var _methods = [];

  onTapSubmit() async {
    if (Validate.addAccount(titleController, accountNoController, _imageString)) {
      if (await WithdrawApi.addAccount(_selectedMethod, titleController.text, accountNoController.text, descriptionController.text, _imageString)) {
        widget.switchFragment(0);
      }
    }
  }

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
    setState(() {
      _image = image;
      _imageString = base64Encode(_image.readAsBytesSync());
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

  void fetchMethods() async {
    EasyLoading.show();
    var methods = await WithdrawApi.methods();
    setState(() {
      _methods = methods;
      _selectedMethod = methods[0].id;
    });
    EasyLoading.dismiss();
  }

  @override
  void initState() {
    fetchMethods();
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
                  : Image.asset("lib/assets/images/card.png"),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50,
            child: InputDecorator(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Clr.green),
                ),
                contentPadding: EdgeInsets.only(bottom: 0, left: 10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  iconEnabledColor: Clr.green,
                  value: _selectedMethod,
                  items: [
                    for (var method in _methods) DropdownMenuItem(value: method.id, child: Text(method.name)),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedMethod = value;
                    });
                  },
                  style: TextStyle(color: Clr.green, fontSize: Sizer.fontSix()),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          input(context, titleController, 'Title'),
          SizedBox(height: 10),
          input(context, accountNoController, 'Account No'),
          SizedBox(height: 10),
          textArea(context, descriptionController, 'Description (optional)'),
          SizedBox(
            height: 10,
          ),
          button(context, 'Submit', onPress: onTapSubmit),
        ],
      ),
    );
  }
}
