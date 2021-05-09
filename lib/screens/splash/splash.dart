import 'package:driver/helpers/auth.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoNextScreen();
    super.initState();
  }

  void gotoNextScreen() async {
      Future.delayed(Duration(seconds: 2, milliseconds: 0), () async {      
        if (await Auth.check())
          Navigator.popAndPushNamed(context, 'home');
        else
          Navigator.popAndPushNamed(context, 'login');
      });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(50.0),
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.1,
            ),
            Image.asset('assets/logo.png'),
            SizedBox(
              height: screenSize.height * 0.2,
            ),
            Container(
              width: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SlideInLeft(
                    duration: Duration(seconds: 3),
                    from: 300.0,
                    child: Image.asset('assets/location.png'),
                  ),
                ],
              ),
            ),
            Image.asset('assets/text.png')
          ],
        ),
      ),
    );
  }
}
