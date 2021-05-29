import 'package:driver/helpers/auth.dart';
import 'package:driver/values/Clr.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: non_constant_identifier_names
Widget SideDrawer(context) {
  return Drawer(
    child: SafeArea(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Clr.green,
            ),
            accountName: Text(Auth.user().name),
            accountEmail: Text(Auth.user().email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 45,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(45)),
                child: Image.network(Auth.user().profileImage),
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.home, color: Clr.green),
            title: Text('Home'),
            selected: false,
            onTap: () {
              Navigator.popAndPushNamed(context, 'home');
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.wallet, color: Clr.green),
            title: Text('Wallet'),
            selected: false,
            onTap: () {
              Navigator.popAndPushNamed(context, 'wallet');
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.moneyBillWave, color: Clr.green),
            title: Text('Withdraw'),
            selected: false,
            onTap: () {
              Navigator.popAndPushNamed(context, 'withdraw');
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.buffer, color: Clr.green),
            title: Text('Transactions'),
            selected: false,
            onTap: () {
              Navigator.popAndPushNamed(context, 'transactions');
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.userCog, color: Clr.green),
            title: Text('Profile'),
            selected: false,
            onTap: () {
              Navigator.popAndPushNamed(context, 'profile');
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.signOutAlt, color: Clr.green),
            title: Text('Logout'),
            selected: false,
            onTap: () {
              Auth.logout();
              Navigator.of(context).pushNamedAndRemoveUntil('login', (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    ),
  );
}
