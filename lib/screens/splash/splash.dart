import 'package:driver/helpers/auth.dart';
import 'package:driver/helpers/easyloading_helper.dart';
import 'package:driver/helpers/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animationCompleted = false;
  bool authCheck;

  @override
  void initState() {
    super.initState();
    initApplication();
  }

  initApplication() async {
    await FirebaseHelper.init();

    EasyloadingHelper.init();

    gotoNextScreen();
  }

  Future checkAuth() async {
    authCheck = await Auth.check();
    return Future.value(true);
  }

  Future completeAnimation() async {
    await Future.delayed(Duration(seconds: 5, milliseconds: 0), () async {
      animationCompleted = true;
      return Future.value(true);
    });
    return;
  }

  void gotoNextScreen() async {
    await Future.wait([completeAnimation(), checkAuth()]);

    if (authCheck)
      Navigator.popAndPushNamed(context, 'home');
    else
      Navigator.popAndPushNamed(context, 'login');
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
                    duration: Duration(seconds: 4),
                    from: 130.0,
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
